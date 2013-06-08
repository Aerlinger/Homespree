class Homeowner < ActiveRecord::Base

  # Authentication:  --------------------------------------------------------------------------------------------------

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                   :address, :appointments, :email, :first_name, :last_name, :photos



  has_one :address, as: :addressable, dependent: :destroy

  has_many :appointments, through: :contractors
  has_many :contractors, through: :appointments

  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :appointments, :appointments

end
