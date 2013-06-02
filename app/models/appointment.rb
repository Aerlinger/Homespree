class Appointment < ActiveRecord::Base
  attr_accessible :address_id, :date, :photos, :reminders, :time

  belongs_to :contractor
  belongs_to :homeowner
  has_one :address
  has_one :job

  validates_presence_of :address_id, :date, :time, :contractor, :homeowner

end
