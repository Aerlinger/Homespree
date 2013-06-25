# == Schema Information
#
# Table name: homeowners
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  photos_id              :integer
#  appointments_id        :integer
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  guest                  :boolean
#

class Homeowner < ActiveRecord::Base

  # Authentication:  --------------------------------------------------------------------------------------------------

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  # Validations -------------------------------------------------------------------------------------------------------

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessor :password
  attr_protected

  # Associations:  ----------------------------------------------------------------------------------------------------
  has_one :address, as: :addressable, dependent: :destroy
  has_many :alerts, as: :alertable

  has_many :appointments
  has_many :projects, through: :appointments
  has_many :contractors, through: :appointments, uniq: true
  has_many :before_photos, as: :photographable, through: :projects
  has_many :after_photos, as: :photographable, through: :projects

  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :appointments, :address

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  after_create :send_welcome_message
  before_save :upgrade_guest_if_logging_in, if: :guest

  def mailboxer_email(object)
    self.email
  end

  def self.new_homeowner_guest
    new { |u| u.guest = true }
  end

  def name
    guest ? "Guest" : first_name
  end

  def move_to(homeowner)
    appointments.update_all(homeowner_id: homeowner.id)
    before_photos.update_all(photographabe_id: homeowner.id)
    after_photos.update_all(photographabe_id: homeowner.id)
  end

  def self.create_guest(name = "Guest Homeowner")
    guest_homeowner = Homeowner.new do |guest|
      guest.name  = name
      guest.guest = true
      guest.email = "guest_homeowner_#{Time.now.to_i}#{rand(9999)}@example"
    end
    guest_homeowner.save(validate: false)
    return guest_homeowner.id
  end

  def upgrade_to_homeowner
    if self.guest?
      projects
    end
  end

  private

  def send_welcome_message
    welcome_conversation = Conversation.new({ subject: "Welcome to Homespree!" })

    welcome_message = Message.new do |message|
      subject = "Welcome to Homespree!"
      body    = "Body message should go here"
    end

    welcome_conversation.messages << welcome_message
    welcome_message.deliver

    self.mailbox.conversations << welcome_conversation
  end

  def upgrade_guest_if_logging_in
    if self.password
      self.guest = false
    end
  end

end
