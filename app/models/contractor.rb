# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  type                   :string(255)
#  first_name             :string(255)
#  description            :text
#  specialties            :text
#  website                :string(255)
#  facebook               :string(255)
#  twitter                :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)
#  last_name              :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  company_title          :string(255)
#  mobile_number          :string(255)
#  office_number          :string(255)
#  license                :string(255)
#  insurance_limit        :integer
#  bonding_limit          :integer
#  photo_filename         :string(255)
#  slogan                 :text
#  years_experience       :integer
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  authentication_token   :string(255)
#  edited                 :boolean          default(FALSE)
#  hourly_rate            :integer
#  slug                   :string(255)
#  portrait_url           :string(255)
#  logo_url               :string(255)
#  notification_settings  :text
#  guest                  :boolean
#  disabled               :boolean          default(FALSE)
#

class Contractor < User
  # Concerns/Includes:  ----------------------------------------------------------------------------------------------
  include ActionView::Helpers::NumberHelper

  # Gem Class Methods:  ----------------------------------------------------------------------------------------------
  geocoded_by :gmaps4rails_address
  acts_as_gmappable


  friendly_id :company_title, use: :slugged

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_protected

  # Associations:  ----------------------------------------------------------------------------------------------------
  #has_one :profile_picture, as: :photographable, class_name: 'Photo'

  has_many :appointments
  has_many :projects, through: :appointments

  has_many :homeowners, through: :appointments, uniq: true

  has_many :specialties
  has_many :services, class_name: "ServiceType"
  has_many :photos, as: :photographable
  has_many :project_photos, as: :photographable, class_name: "Photo", through: :projects
  has_many :badges

  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :photos, :specialties, :appointments

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_format_of :first_name, :last_name, with: /\A\w+ ?\w*\z/, allow_blank: true, message: "should only contain letters"
  validates_length_of :first_name, :last_name, minimum: 2, maximum: 20, allow_blank: true, message: "must be a reasonable length"

  validates_format_of :mobile_number, :office_number, with: /\A\d{10}\Z/, allow_blank: true, message: "must be valid"
  validates_presence_of :company_title
  validates_numericality_of :years_experience, allow_blank: true


  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_validation :sanitize_phone_numbers
  after_validation :geocode

  before_save lambda { |contractor| contractor.license.try(:upcase!) }
  before_create :add_badges
  after_create :send_welcome_message

  # Scopes:  ----------------------------------------------------------------------------------------------------------
  #default_scope order("created_at desc").where("disabled == ?", "false")
  scope :recent_signups, lambda { limit(100) }



  # Custom Methods:  --------------------------------------------------------------------------------------------------
  def incomplete_sections
    sections = []
    sections << :first_name if first_name.blank?
    sections << :last_name if last_name.blank?
    sections << :company_title if company_title.blank?
    sections << :specialties if specialties.blank?
    sections << :mobile_number if mobile_number.blank?
    sections << :office_number if office_number.blank?
    sections << :slogan if slogan.blank?
    sections << :description if description.blank?
    sections << :address if address.blank?

    return sections
  end

  def mailboxer_email(object)
    self.email
  end

  def name
    if first_name? && last_name?
      "#{first_name.capitalize} #{last_name.capitalize}"
    elsif first_name?
      first_name
    else
      company_title
    end
  end

  def to_s
    name
  end

  def homeowner?
    false
  end

  def contractor?
    true
  end

  # TODO: Move this into a module
  def gmaps4rails_address
    [line1, city, state, zipcode].compact.join(', ')
  end

  def sanitize_phone_numbers
    self.mobile_number.try(:gsub!, /\D/, '')
    self.office_number.try(:gsub!, /\D/, '')
  end

  def logo_url
    read_attribute(:logo_url)
  end

  def portrait_url
    read_attribute(:portrait_url) || "/assets/contractor_profiles/portrait_default.jpg"
  end

  private

  def add_badges
    badge      = Badge.new
    badge.name = 'early_adopter'
    self.badges << badge
  end

  def send_welcome_message
  end
end
