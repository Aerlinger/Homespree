class Contractor < ActiveRecord::Base

  # Authentication:  --------------------------------------------------------------------------------------------------

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me,
                  :description, :mobile_number, :office_number, :title,
                  :facebook, :name, :specialties, :twitter, :website

  # Associations:  ----------------------------------------------------------------------------------------------------
  has_many :appointments
  has_many :specialties
  has_many :addresses, as: :addressable
  accepts_nested_attributes_for :addresses

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_format_of :first_name, :last_name, with: /\A\w+\z/, allow_blank: true, message: "should only contain letters"
  validates_length_of :first_name, :last_name, minimum: 2, maximum: 20, allow_blank: true, message: "must be valid"
  validates_format_of :email, with: email_regex, message: "is invalid"
  validates_uniqueness_of :email, message: "is already taken"
  validates_format_of :mobile_number, :office_number, with: /\A\d{10}\Z/, allow_blank: true
  validate :name_or_title?

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_save :titleize_name, :downcase_email

  # Scopes:  ----------------------------------------------------------------------------------------------------------
  default_scope order("created_at desc")


  # Generates a list of incomplete elements of a Contractor profile
  def incomplete_sectio
    sections = []

    sections << :first_name if first_name.blank?
    sections << :last_name if last_name.blank?
    sections << :title if title.blank?
    sections << :specialties if specialties.blank?
    sections << :mobile_number if mobile_number.blank?
    sections << :office_number if office_number.blank?
    sections << :addresses if addresses.blank?
    sections << :website if website.blank?
    sections << :facebook if facebook.blank?
    sections << :twitter if twitter.blank?

    return sections
  end


  private

  def titleize_name
    self.first_name[0] = first_name[0].upcase if first_name.present?
    self.last_name[0] = last_name[0].upcase if last_name.present?
  end

  def downcase_email
    self.email.downcase! if self.email.present?
  end

  def convert_numbers
    self.office_number = convert_number(office_number)
    self.mobile_number = convert_number(mobile_number)
  end

  # Converts a number to a (xxx) yyy-zzzz format (United States)
  def convert_number(number)
    if !number.blank?
      begin
        number = number_to_phone(number.gsub!(/\D/, ''), :area_code => true, throw: true)
      rescue StandardError
        errors.add(:phone_number, "phone number is invalid")
      end
    end
    return number
  end

  # Validates the presence of first_name and last_name OR presence of a title
  def name_or_title?
    unless self.title.present? || (first_name.present? && last_name.present?)
      errors.add(:title, "must include either a title or first and last name")
    end
  end

end
