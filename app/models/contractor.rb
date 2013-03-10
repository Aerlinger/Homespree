class Contractor < ActiveRecord::Base

  # Authentication:

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Accessors:

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :description, :mobile_number, :office_number,
                  :facebook, :name, :specialties, :twitter, :website

  # Associations:
  has_many :addresses, as: :addressable
  has_many :appointments

  validates_presence_of :password
  validates :email, presence: true, uniqueness: true

  # Callbacks:
  before_save :titleize_name, :downcase_email

  # Only email is required for now:
  validates_format_of :email, with: email_regex, message: "Email is invalid"

  accepts_nested_attributes_for :addresses


  # Generates a list of incomplete elements of a Contractor profile
  def incomplete_sections
    sections = []

    sections << :name if name.blank? && title.blank?
    sections << :title if title.blank?
    sections << :specialties if specialties.blank?
    sections << :addresses if addresses.blank?
    sections << :mobile_number if mobile_number.blank?
    sections << :office_number if office_number.blank?
    sections << :website if website.nil?
    sections << :facebook if facebook.nil?
    sections << :twitter if twitter.nil?

    return sections
  end

  private

  def titleize_name
    self.name = self.name.titleize if self.name.present?
    self.last_name = self.last_name.titleize if self.last_name.present?
  end

  def downcase_email
    self.email.downcase! if self.email.present?
  end

  def convert_numbers
    self.office_number = convert_number(self.office_number)
    self.mobile_number = convert_number(self.mobile_number)
  end

  # Converts a number to a (xxx) yyy-zzzz format (United States)
  def convert_number(number)
    if !number.blank?
      begin
        number.gsub!(/\D/, '')
        #number = number_to_phone(number, :area_code => true, throw: true)
      rescue Error
        self.errors.add(:field, "Phone number is invalid")
        return nil
      end
    end
    true
  end

end
