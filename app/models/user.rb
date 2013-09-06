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
#  gmaps                  :boolean          default(TRUE)
#  latitude               :float
#  longitude              :float
#

class User < ActiveRecord::Base
  # Gem Class Methods:  ----------------------------------------------------------------------------------------------
  # Devise Modules: :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  acts_as_messageable

  #attr_accessor :zipcode

  # Associations:  ----------------------------------------------------------------------------------------------------
  has_one :address, as: :addressable, dependent: :destroy
  has_many :alerts, as: :alertable

  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :address, :alerts

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates :email, email: true
  validates_uniqueness_of :email

  # Scope:  -----------------------------------------------------------------------------------------------------------
  default_scope -> { order("created_at desc") }


  # TODO: FixMe
  def nearby_contractors(radius = 25)
    nearby_addresses = self.address.nearbys.where(addressable_type: 'User').where.not(addressable_id: nil)
    Contractor.joins(:address).where(id: nearby_addresses.map(&:addressable_id))
  end

  def nearby_homeowners(radius = 25)
    nearby_addresses = self.address.nearbys.where(addressable_type: 'User').where.not(addressable_id: nil)
    Homeowner.joins(:address).where(id: nearby_addresses.map(&:addressable_id))
  end

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_save :capitalize_name
  before_save lambda { |user| user.email.try(:downcase!) }
  before_create :set_address_from_zipcode
  after_create :send_welcome_message


  # Delegations:  -----------------------------------------------------------------------------------------------------
  delegate :to_coordinates, :line1, :line2, :city, :state, :state=, :zipcode,
           :gmaps4rails_address, :nearby, to: :address, allow_nil: true

  def gmaps4rails_marker_picture
    marker_color = 'red'
    { picture: "/assets/map_markers/#{self.class.name}-icon#{marker_color}.png", width: "28", height: "33" }
  end

  def distance_to(another_user)
    if self.address && another_user
      self.address.distance_to(another_user)
    end
  end

  def latitude
    address.latitude
  end

  def longitude
    address.longitude
  end

  def zipcode=(value)
    if address.present?
      self.address.zipcode = value
    else
      self.create_address(zipcode: value)
    end
  end

  def capitalize_name
    self.first_name = first_name.try(:downcase).try(:titleize)
    self.last_name  = last_name.try(:downcase).try(:titleize)
  end

  private

  def set_address_from_zipcode
    if self.zipcode.present?
      self.create_address(zipcode: zipcode)
    end
  end

end
