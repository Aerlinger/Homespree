class Contractor < ActiveRecord::Base
  attr_accessible :description, :facebook, :name, :number, :specialties, :twitter, :website

  has_one :address, as: :addressable

  validates_presence_of :address, :name, :email

  validates_format_of :number, format: { with: /^\d{3}-?\d{3}-?\d{4}$/ }
  validates_format_of :email, format: { with: email_regex }

end
