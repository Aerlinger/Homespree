class Appointment < ActiveRecord::Base
  attr_accessible :address_id, :date, :photos, :reminders, :time, :title, :description

  belongs_to :contractor
  belongs_to :homeowner
  has_one :address, as: :addressable
  has_one :job

  validates_presence_of :date, :time, :address, :contractor, :homeowner

end
