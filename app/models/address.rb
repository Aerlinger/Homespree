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
#  service_radius   :integer          default(20)
#

class Address < ActiveRecord::Base
  # Class Methods:  ---------------------------------------------------------------------------------------------------
  geocoded_by :gmaps4rails_address

  attr_protected :latitude, :longitude

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates :zipcode, format: RegexDefinitions::zipcode_regex, allow_blank: true
  validates_format_of :state, with: /[A-Za-z][A-Za-z]/i, allow_blank: true

  belongs_to :addressable, polymorphic: true
  has_many :appointments

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_save :titleize_city
  after_validation :geocode unless Rails.env.test?    # Running Geocoder in tests causes the API to throttle us.

  # Callback method definitions:  -------------------------------------------------------------------------------------

  def gmaps4rails_address
    [line1, city, state, zipcode].compact.join(', ')
  end

  protected

  def titleize_city
    if city.present?
      self.city = city.titleize
    end
  end
end
