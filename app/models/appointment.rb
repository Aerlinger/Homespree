# == Schema Information
#
# Table name: appointments
#
#  id            :integer          not null, primary key
#  date          :date
#  time          :datetime
#  address_id    :integer
#  photos        :string(255)
#  reminders     :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  contractor_id :integer
#  title         :string(255)
#  description   :string(255)
#

class Appointment < ActiveRecord::Base
  attr_accessible :address_id, :date, :photos, :reminders, :time, :title, :description

  belongs_to :contractor
  belongs_to :homeowner
  has_one :address, as: :addressable
  has_one :job

  validates_presence_of :date, :time, :address, :contractor, :homeowner

end
