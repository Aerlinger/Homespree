class Address < ActiveRecord::Base
  attr_accessible :addressable_id, :addressable_type, :city, :line1, :line2, :state, :zipcode

  validates :zipcode, format: RegexDefinitions::zipcode_regex, allow_blank: true
  validates_format_of :state, with: /[A-Za-z][A-Za-z]/i, allow_blank: true

  belongs_to :addressable, polymorphic: true

  before_save :titleize_city

  private

  def titleize_city
    if city.present?
      self.city = city.titleize
    end
  end
end