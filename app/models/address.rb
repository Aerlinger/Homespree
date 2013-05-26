class Address < ActiveRecord::Base

  # Class Methods:  ---------------------------------------------------------------------------------------------------
  geocoded_by :single_address

  attr_accessible :addressable_id, :addressable_type, :city, :line1, :line2, :state, :zipcode

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates :zipcode, format: RegexDefinitions::zipcode_regex, allow_blank: true
  validates_format_of :state, with: /[A-Za-z][A-Za-z]/i, allow_blank: true

  belongs_to :addressable, polymorphic: true

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_save :titleize_city
  after_validation :geocode

  # Callback method definitions:  -------------------------------------------------------------------------------------
  protected

  def titleize_city
    if city.present?
      self.city = city.titleize
    end
  end

  def single_address
    [line1, city, state].compact.join(', ')
  end

end