class Contractor < ActiveRecord::Base

  # Authentication:  --------------------------------------------------------------------------------------------------

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me,
                  :description, :mobile_number, :office_number, :company_title,
                  :facebook, :name, :specialties, :twitter, :website

  # Associations:  ----------------------------------------------------------------------------------------------------
  has_many :appointments
  has_many :specialties
  has_many :addresses, as: :addressable
  accepts_nested_attributes_for :addresses


  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_format_of :first_name, :last_name, with: /\A\w+\z/, allow_blank: true, message: "should only contain letters"
  validates_length_of :first_name, :last_name, minimum: 2, maximum: 20, allow_blank: true, message: "must be valid"
  validates_format_of :email, with: RegexDefinitions::email_regex, message: "is invalid"
  validates_uniqueness_of :email, message: "is already taken"
  validates_format_of :mobile_number, :office_number, with: /\A\d{10}\Z/, allow_blank: true, message: "must be valid"
  validate :name_or_title?

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_save :titleize_name, :downcase_email
  before_validation :sanitize_phone_numbers

  # Scopes:  ----------------------------------------------------------------------------------------------------------
  default_scope order("created_at desc")


  # Generates a list of incomplete elements of a Contractor profile
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
    sections << :addresses if addresses.blank?

    return sections
  end


  private

  def clean_params
    #if params[:mobile_area_code]
    #  self.mobile_number = params[:mobile_area_code] << params[:mobile_prefix] << params[:mobile_suffix]
    #end
    #
    #if params[:office_area_code]
    #  self.office_number = params[:office_area_code] << params[:office_prefix] << params[:office_suffix]
    #end
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

  # Validates the presence of first_name and last_name OR presence of a title
  def name_or_title?
    unless self.company_title.present? || (first_name.present? && last_name.present?)
      errors.add(:company_title, "must include either a title or first and last name")
    end
  end

end
