class Address < ActiveRecord::Base
  attr_accessible :addressable_id, :addressable_type, :city, :line1, :line2, :state, :zipcode

  validates_presence_of :city, :line1, :state, :zipcode

  validates :zipcode, format: zipcode_regex

  belongs_to :addressable, polymorphic: true
end
