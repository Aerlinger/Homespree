# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  user_type              :string(255)
#  first_name             :string(255)
#  description            :text
#  specialties            :text
#  website                :string(255)
#  facebook               :string(255)
#  twitter                :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      not null
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
#

class Contractor < User

  # Concerns/Includes:  ----------------------------------------------------------------------------------------------
  include ActionView::Helpers::NumberHelper

  # Gem Class Methods:  ----------------------------------------------------------------------------------------------

  extend FriendlyId
  friendly_id :company_title, use: :slugged

  mount_uploader :logo_url, LogoUploader
  mount_uploader :portrait_url, PortraitUploader

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_protected

  # Associations:  ----------------------------------------------------------------------------------------------------
  has_one :address, as: :addressable, dependent: :destroy
  has_one :profile_picture, as: :photographable, class_name: 'Photo'
  has_many :alerts, as: :alertable

  has_many :appointments
  has_many :homeowners, through: :appointments, uniq: true
  has_many :projects, through: :appointments

  has_many :specialties
  has_many :services, class_name: "ServiceType"
  has_many :photos, as: :photographable
  has_many :project_photos, as: :photographable, class_name: "Photo", through: :projects
  has_many :badges
  has_many :alerts, as: :alertable


  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :address, :photos, :appointments, :specialties, :profile_picture


  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_format_of :first_name, :last_name, with: /\A\w+ ?\w*\z/, allow_blank: true, message: "should only contain letters"
  validates_length_of :first_name, :last_name, minimum: 2, maximum: 20, allow_blank: true, message: "must be a reasonable length"
  validates_format_of :email, with: RegexDefinitions::email_regex, message: "is invalid"
  validates_uniqueness_of :email
  validates_format_of :mobile_number, :office_number, with: /\A\d{10}\Z/, allow_blank: true, message: "must be valid"
  validates_presence_of :company_title
  validates_numericality_of :years_experience, allow_blank: true


  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_validation :sanitize_phone_numbers, :set_user_type
  before_save lambda { |contractor| contractor.email.try(:downcase!) }
  before_save lambda { |contractor| contractor.license.try(:upcase!) }
  before_create :add_badges
  after_create :add_portfolio_image
  after_create :send_welcome_message

  # Scopes:  ----------------------------------------------------------------------------------------------------------
  #default_scope order("created_at desc")
  default_scope lambda { User.where("user_type = ?", "Contractor") }
  scope :recent_signups, lambda { limit(100) }
  scope :locate, lambda { |zipcode, radius| nil }

  # Delegations:  -----------------------------------------------------------------------------------------------------
  delegate :line1, :line2, :city, :state, :zipcode, :latitude, :longitude, :single_address, to: :address, allow_nil: true

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

  protected

  def sanitize_phone_numbers
    self.mobile_number.try(:gsub!, /\D/, '')
    self.office_number.try(:gsub!, /\D/, '')
  end

  private

  def add_portfolio_image
    self.photos = [Photo.create(image_url: "/assets/contractor_profiles/portfolio_images/default.png")]
  end

  def add_badges
    badge = Badge.new
    badge.name = 'early_adopter'
    self.badges << badge
  end

  private

  def send_welcome_message
    admin = Contractor.find_by_email("admin@myhomespree.com")
    if admin
      subject = "Welcome to Homespree!"
      body = "Body message should go here"

      #admin.send_message(self, body, subject)
    end
  end

  def set_user_type
    self.user_type = "Contractor"
  end

end
