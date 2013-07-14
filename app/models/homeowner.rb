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

class Homeowner < User

  # Authentication:  --------------------------------------------------------------------------------------------------

  # Validations -------------------------------------------------------------------------------------------------------

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_protected

  # Associations:  ----------------------------------------------------------------------------------------------------
  has_many :appointments
  has_many :projects, through: :appointments

  has_many :contractors, through: :appointments, uniq: true
  has_many :before_photos, as: :photographable, through: :projects
  has_many :after_photos, as: :photographable, through: :projects

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  after_save :upgrade_guest_if_logging_in, if: :guest
  accepts_nested_attributes_for :appointments

  # Scopes:  ----------------------------------------------------------------------------------------------------------


  def mailboxer_email(object)
    self.email
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
      guest.first_name  = name
      guest.guest = true
      guest.email = "guest_homeowner_#{Time.now.to_i}_#{rand(99999)}@example"
    end
    guest_homeowner.save(validate: false)
    return guest_homeowner
  end

  def homeowner?
    return true
  end

  def contractor?
    return false
  end

  def upgrade_to_homeowner
    if self.guest?
    end
  end

  private

  def send_welcome_message
    welcome_conversation = Conversation.new({ subject: "Welcome to Homespree!" })

    welcome_message = Message.new do |message|
      subject = "Welcome to Homespree!"
      body    = "Welcome homeowner!"
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
