# == Schema Information
#
# Table name: appointments
#
#  id                      :integer          not null, primary key
#  starts_at               :datetime
#  photos                  :string(255)
#  reminders               :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  contractor_id           :integer
#  title                   :string(255)
#  description             :string(255)
#  homeowner_id            :integer
#  duration                :decimal(, )
#  project_id              :integer
#  verified_by_homeowner   :boolean          default(FALSE)
#  verified_by_contractor  :boolean          default(FALSE)
#  completed_by_homeowner  :boolean          default(FALSE)
#  completed_by_contractor :boolean          default(FALSE)
#  user_id                 :integer
#

class Appointment < ActiveRecord::Base
  attr_accessor :zipcode
  attr_accessible :address_id, :photos, :reminders, :starts_at, :title, :description, :duration,
                  :address_attributes, :contractor_id, :homeowner_id, :zipcode

  # Associations:  --------------------------------------------------------------------------------------------------
  belongs_to :contractor, foreign_key: "contractor_id"
  belongs_to :homeowner, foreign_key: "homeowner_id"
  belongs_to :project
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

  def postpone_by(delay)
    self.starts_at += delay
  end

  def time_passed
    Time.now - ends_at
  end

  def passed?
    Time.now > ends_at
  end

  def time_until
    starts_at - Time.now
  end

  def in_progress?
    Time.now < ends_at && Time.now > starts_at
  end

end
