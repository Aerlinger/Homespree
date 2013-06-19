# == Schema Information
#
# Table name: appointments
#
#  id                      :integer          not null, primary key
#  starts_at               :datetime
#  address_id              :integer
#  photos                  :string(255)
#  reminders               :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  contractor_id           :integer
#  title                   :string(255)
#  description             :string(255)
#  homeowner_id            :integer
#  duration                :decimal(, )
#  job_id                  :integer
#  verified_by_homeowner   :boolean          default(FALSE)
#  verified_by_contractor  :boolean          default(FALSE)
#  completed_by_homeowner  :boolean          default(FALSE)
#  completed_by_contractor :boolean          default(FALSE)
#

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
#  homeowner_id  :integer
#  duration      :decimal(, )
#  job_id        :integer
#
class Appointment < ActiveRecord::Base
  attr_accessible :address_id, :photos, :reminders, :starts_at, :title, :description, :duration, :address_attributes

  # Associations:  --------------------------------------------------------------------------------------------------
  belongs_to :contractor
  belongs_to :homeowner
  belongs_to :job
  has_one :address, as: :addressable

  accepts_nested_attributes_for :address

  # Validations:  --------------------------------------------------------------------------------------------------
  validates_presence_of :starts_at, :duration, :address


  # Custom Methods:  -----------------------------------------------------------------------------------------------
  def ends_at
    starts_at + duration.hours
  end

  def overlaps_with?(other_appointment)
    (starts_at - other_appointment.ends_at) * (other_appointment.starts_at - ends_at) >= 0
  end

end
