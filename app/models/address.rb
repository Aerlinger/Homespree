class Address < ActiveRecord::Base
  attr_accessible :addressable_id, :addressable_type, :city, :line1, :line2, :state, :zipcode

  validates_presence_of :city, :line1, :state, :zipcode

  validates :zipcode, format: RegexDefinitions::zipcode_regex
  validates_format_of :state, with: /[A-Za-z][A-Za-z]/i

  belongs_to :addressable, polymorphic: true

  before_save :titleize_city

  private

  def titleize_city
    self.city = self.city.titleize
  end
end