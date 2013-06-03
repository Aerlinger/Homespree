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
    a = Appointment.create(FactoryGirl.attributes_for(:appointment))
    a.should be_valid
    a.should be_persisted
  end

end
