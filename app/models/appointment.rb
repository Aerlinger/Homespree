class Appointment < ActiveRecord::Base
  attr_accessible :address_id, :date, :photos, :reminders, :time

  belongs_to :contractor
  has_one :address

  validates_presence_of :address_id, :date, :time, :contractor


end
