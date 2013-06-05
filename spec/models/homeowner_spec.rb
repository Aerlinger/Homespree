require 'spec_helper'

describe Homeowner do
  it { should respond_to :email }

  let(:homeowner) { FactoryGirl.create(:homeowner) }

  it "is valid" do
    homeowner.should be_valid
    homeowner.should be_persisted
  end

  it "can have many appointments" do
    homeowner.appointments << FactoryGirl.create(:appointment)
  end
end