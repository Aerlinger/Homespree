# == Schema Information
#
# Table name: specialties
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  endorser_id   :integer
#  contractor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string(255)
#  position      :integer
#  hourly_rate   :decimal(, )      default(50.0)
#

require 'spec_helper'

describe Specialty do

  let(:contractor) { FactoryGirl.create(:contractor) }
  let(:specialty) { FactoryGirl.create(:specialty) }
  subject { specialty }

  it { should respond_to :name }
  it { should respond_to :description }

  it { should be_valid}

  it "is invalid without a predifined name" do
    s = Specialty.create(name: "some bullshit")
    s.should_not be_valid
  end

  describe "belongs to both and endorser and contractor" do
    it { should respond_to :endorser_id }
    it { should respond_to :contractor_id }
    it { should respond_to :hourly_rate }
  end

  describe "associated with a contractor" do

    before do
      contractor.specialties << specialty
    end

    it "creates a single specialty" do
      contractor.specialties.should eq [specialty]
    end

    it "persists the specialty" do
      contractor.should be_persisted
      contractor.specialties.first.should be_persisted
    end

    it "the specialty should cost 50 dollars per hour by default" do
      contractor.specialties.first.should eq 50.00
    end

  end
end
