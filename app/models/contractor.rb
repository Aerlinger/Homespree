class Contractor < ActiveRecord::Base

  # Authentication:

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Accessors:

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :description,
                  :facebook, :name, :number, :specialties, :twitter, :website

  # Associations:
  has_many :addresses, as: :addressable
  has_many :appointments

  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password

  # Callbacks:
  before_save :titleize_name, :downcase_email, :convert_number


  # Only email is required for now:
  validates_format_of :email, with: email_regex, message: "Email is invalid"

  # Generates a list of incomplete elements of a Contractor profile
  def incomplete_sections
    sections = []

    sections << :name if name.nil? && title.nil?
    sections << :title if title.nil?
    sections << :specialties if specialties.nil?
    sections << :addresses if addresses.blank?
    sections << :number if number.nil?
    sections << :website if website.nil?
    sections << :facebook if facebook.nil?
    sections << :twitter if twitter.nil?

    return sections
  end

  private

  def titleize_name
    self.name = self.name.titleize if self.name.present?
    self.last_name = self.last_name.titleize if self.name.present?
  end

  def downcase_email
    self.email.downcase! if self.email.present?
  end

  # Converts a number to a (xxx) yyy-zzzz format (United States)
  def convert_number
    if self.number.present?
      begin
        self.number.gsub!(/\D/, '')
        self.number = number_to_phone(self.number, :area_code => true, throw: true)
      rescue InvalidNumberError
        self.errors.add(:field, "Phone number is invalid")
      end
    end
    true
  end

end
