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
  let(:address) { FactoryGirl.create(:address) }

  subject { address }

  context "table columns" do
    it { should respond_to :line1 }
    it { should respond_to :line2 }
    it { should respond_to :city }
    it { should respond_to :state }
    it { should respond_to :zipcode }
    it { should respond_to :service_radius }
    it { should respond_to :addressable_id }
    it { should respond_to :addressable_type }
  end

  it { should belong_to :addressable }

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

  #describe "created as a nested attribute of contractor" do
  #  let(:params) do
  #    { contractor: attributes_for(:contractor, address_attributes: attributes_for(:address)) }
  #  end
  #  let(:contractor) { Contractor.create(params[:contractor]) }
  #
  #  subject { contractor }
  #
  #  its("address.gmaps4rails_address") { should eq address.gmaps4rails_address }
  #end

  describe "created as a nested attribute of homeowner" do
    let(:address) { FactoryGirl.create :address, latitude: 28.5, longitude: 29.5 }

    let(:params) do
      { homeowner: attributes_for(:homeowner, address: address) }
    end

    before { @homeowner = Homeowner.create(params[:homeowner]) }

    it "has a valid address" do
      @homeowner.address.should be_persisted
    end

    it "has a valid address" do
      @homeowner.address.gmaps4rails_address.should eq address.gmaps4rails_address
    end

    specify "address has User as an addressable type" do
      address.addressable_type.should eq "User"
    end
  end

  describe "created as a nested attribute of an appointment" do
    let(:params) do
      { appointment: attributes_for(:appointment, address_attributes: attributes_for(:address)) }
    end

    before { @appointment = Appointment.create(params[:appointment]) }

    it "persists appointment" do
      @appointment.should be_persisted
    end

    it "has a valid address" do
      @appointment.address.should be_persisted
    end

    it "has have a valid address" do
      @appointment.address.gmaps4rails_address.should eq address.gmaps4rails_address
    end
  end
end
