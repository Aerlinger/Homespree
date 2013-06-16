# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  line1            :string(255)
#  line2            :string(255)
#  city             :string(255)
#  state            :string(255)
#  zipcode          :string(255)
#  addressable_id   :integer
#  addressable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  latitude         :float
#  longitude        :float
#  service_radius   :integer          default(20)
#

require 'spec_helper'

describe Address do

  it { should respond_to :line1 }
  it { should respond_to :line2 }
  it { should respond_to :city }
  it { should respond_to :state }
  it { should respond_to :zipcode }
  it { should respond_to :service_radius }
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

  it "catches invalid zip code" do
    address.zipcode = "1234a"
    address.save

    address.errors[:zipcode].should include("is invalid")

    address.zipcode = "1234"
    address.should_not be_valid
  end

  describe "created as a nested attribute of contractor" do

    let(:params) do
      {
        contractor: FactoryGirl.attributes_for(:contractor,
                                               address_attributes: FactoryGirl.attributes_for(:address))
      }
    end

    before { @contractor = Contractor.create(params[:contractor]) }

    it "should persist contractor" do
      @contractor.should be_persisted
    end

    it "should have a valid address" do
      @contractor.address.should be_persisted
    end

    it "should have a valid address" do
      @contractor.address.single_address.should eq address.single_address
    end

  end

end
