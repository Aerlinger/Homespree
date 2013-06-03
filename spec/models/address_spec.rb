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

  it "catches valid zip code" do
    subject.zipcode = "12345"
    subject.save
    subject.errors[:zipcode].should be_empty
  end

  it "catches invalid zip code" do
    subject.zipcode = "1234a"
    subject.save

    subject.errors[:zipcode].should include("is invalid")

    subject.zipcode = "1234"
    subject.should_not be_valid
  end

end
