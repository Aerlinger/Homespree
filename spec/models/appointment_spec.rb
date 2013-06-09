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

require 'spec_helper'

describe Appointment do

  it { should respond_to :address_id }
  it { should respond_to :date }
  it { should respond_to :time }
  it { should respond_to :reminders }
  it { should respond_to :photos }
  it { should respond_to :title }
  it { should respond_to :description }

  it { should respond_to :contractor }
  it { should respond_to :address }

  let(:appointment) { FactoryGirl.create :appointment }

  it "should create a valid appointment" do
    appointment.should be_valid
    appointment.should be_persisted
  end

  it "has one job" do
    appointment.job.should_not be_nil
  end

end
