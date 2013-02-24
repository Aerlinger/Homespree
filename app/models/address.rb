class Address < ActiveRecord::Base
  attr_accessible :addressable_id, :addressable_type, :city, :line1, :line2, :state, :zip

  belongs_to :addressable, polymorphic: true
end
