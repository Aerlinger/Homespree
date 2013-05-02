class Contractor < ActiveRecord::Base

  # Authentication:  --------------------------------------------------------------------------------------------------

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessible :address, :specialties, :first_name, :last_name, :email, :password, :remember_me,
                  :description, :mobile_number, :office_number, :company_title, :custom_field,
                  :facebook, :name, :specialties, :twitter, :website, :other_specialties, :specialty_ids


  # Associations:  ----------------------------------------------------------------------------------------------------
  has_many :appointments
  has_many :specialties
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address, reject_if: lambda { |attributes| attributes['kind'].blank? }
  accepts_nested_attributes_for :specialties, reject_if: lambda { |attributes| attributes['kind'].blank? }


  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_format_of :first_name, :last_name, with: /\A\w+\z/, allow_blank: true, message: "should only contain letters"
  validates_length_of :first_name, :last_name, minimum: 2, maximum: 20, allow_blank: true, message: "must be valid"
  validates_format_of :email, with: RegexDefinitions::email_regex, message: "is invalid"
  validates_uniqueness_of :email, message: "is already taken"
  validates_format_of :mobile_number, :office_number, with: /\A\d{10}\Z/, allow_blank: true, message: "must be valid"
  validate :name_or_title?


  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_save :titleize_name, :downcase_email, :upcase_license, :process_associations
  before_validation :sanitize_phone_numbers


  # Scopes:  ----------------------------------------------------------------------------------------------------------
  default_scope order("created_at desc")


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

  def name_or_title
    if company_title.present?
      return company_title
    else
      return "#{first_name} #{last_name}"
    end
  end

  protected

  def process_associations
    if address.blank?
      build_address
    end
  end

  def sanitize_phone_numbers
    self.mobile_number.gsub!(/\D/, '') if self.mobile_number.present?
    self.office_number.gsub!(/\D/, '') if self.office_number.present?
  end

  def titleize_name
    self.first_name[0] = first_name[0].upcase if first_name.present?
    self.last_name[0] = last_name[0].upcase if last_name.present?
  end

  def downcase_email
    self.email.downcase! if self.email.present?
  end

  def upcase_license
    self.license.upcase! if self.license.present?
  end

  # Validates the presence of first_name and last_name OR presence of a title
  def name_or_title?
    unless self.company_title.present? || (first_name.present? && last_name.present?)
      errors.add(:company_title, "must include either a title or first and last name")
    end
  end

  # This is used to prevent problems when params are missing in the controller before the contractor is created.
  def nil_if_blank
    self.attributes.each { |attr| self[attr] = nil if self[attr].blank? }
  end

end
