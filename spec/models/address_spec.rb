require 'spec_helper'

describe Address do

  it { should respond_to :line1 }
  it { should respond_to :line2 }
  it { should respond_to :city }
  it { should respond_to :state }
  it { should respond_to :zipcode }
  it { should respond_to :addressable_id }
  it { should respond_to :addressable_type }

  let(:address) { FactoryGirl.create(:address) }

  it "should be valid" do
    address.should be_valid
    address.should be_persisted
  end

  it "catches valid zip code" do
    address.zipcode = "12345"
    address.save
    address.errors[:zipcode].should be_empty
  end

  it "is invalid without address line" do
    address.city = ""
    address.should_not be_valid
  end

  it "catches invalid zip code" do
    address.zipcode = "1234a"
    address.save

    address.errors[:zipcode].should include("is invalid")

    address.zipcode = "1234"
    address.should_not be_valid
  end

end
