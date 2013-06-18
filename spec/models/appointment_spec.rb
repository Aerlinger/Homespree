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

  it { should respond_to :job }
  it { should respond_to :address }
  it { should respond_to :contractor }
  it { should respond_to :homeowner }

  let(:appointment) { FactoryGirl.create :appointment }

  before do
    @contractor = FactoryGirl.create :contractor
    @homeowner = FactoryGirl.create :homeowner
    @job = FactoryGirl.create :job
    @address = FactoryGirl.create :address

    appointment.contractor = @contractor
    appointment.homeowner = @homeowner
    appointment.job = @job
    appointment.address = @address
  end

  it "should create a valid appointment" do
    appointment.should be_valid
    appointment.should be_persisted
  end

  it "should have a single association for contractor, homeowner, job, and address" do
    [:contractor, :homeowner, :job, :address].each do |association|
      appointment.send(association).should be_valid
    end
  end

  describe "A homeowner creates an appointment" do

  end

end
