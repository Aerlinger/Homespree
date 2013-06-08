require 'spec_helper'

describe Homeowner do
  it { should respond_to :email }

  let(:home_owner) { FactoryGirl.create(:homeowner) }

  it "is valid" do
    home_owner.should be_valid
    home_owner.should be_persisted
  end

  it "can have many appointments" do
    home_owner.appointments << FactoryGirl.create(:appointment)
    home_owner.should be_valid
    home_owner.should be_persisted
  end

end