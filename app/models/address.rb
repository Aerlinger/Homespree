# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  line1            :string(255)
#  line2            :string(255)
#  city             :string(255)
#  state            :string(255)
#  zipcode          :string(255)
#  addressable_id   :integer
#  addressable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  latitude         :float
#  longitude        :float
#

class Address < ActiveRecord::Base

  # Class Methods:  ---------------------------------------------------------------------------------------------------
  geocoded_by :single_address

  attr_accessible :addressable_id, :addressable_type, :city, :line1, :line2, :state, :zipcode, :latitude, :longitude

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates :zipcode, format: RegexDefinitions::zipcode_regex, allow_blank: true
  validates_presence_of :line1, allow_blank: true
  validates_presence_of :city, allow_blank: true
  validates_format_of :state, with: /[A-Za-z][A-Za-z]/i, allow_blank: true

  belongs_to :addressable, polymorphic: true

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_save :titleize_city
  after_validation :geocode unless Rails.env.test?    # Running Geocoder in tests causes the API to throttle us.

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
