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
#  address_id             :integer
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
#

class Homeowner < ActiveRecord::Base

  # Authentication:  --------------------------------------------------------------------------------------------------

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                   :address, :appointments, :email, :first_name, :last_name, :photos

  has_one :address, as: :addressable, dependent: :destroy

  has_many :alerts, as: :alertable
  has_many :appointments, through: :contractors
  has_many :contractors, through: :appointments
  has_many :photos, as: :photographable, through: :appointments

  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :appointments, :address

  def mailboxer_email(object)
    self.email
  end

end
