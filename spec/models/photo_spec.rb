# == Schema Information
#
# Table name: photos
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  caption             :string(255)
#  image_url           :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  photographable_id   :integer
#  photographable_type :string(255)
#

require 'spec_helper'

describe Photo do
  it { should respond_to :photographable_id }
  it { should respond_to :image_url }
  it { should respond_to :caption }
  it { should respond_to :name }

  let(:photo) { FactoryGirl.create(:photo) }
  let(:contractor) { FactoryGirl.create(:contractor) }

  subject { photo }

  before do
    contractor.photos = []
    contractor.save
  end

  it { should be_valid }

  describe "invalid params" do
    it "is not valid without image_url" do
      photo.image_url = nil
      photo.should_not be_valid
    end
  end

  specify "Newly created contractor has no photos" do
    contractor.photos.should be_empty
  end

  it " gets added to a contractor" do
    contractor.photos.create(FactoryGirl.attributes_for(:photo))
  end


  it "should persist contractor" do
    contractor.should be_persisted
  end

  it "should not have errors" do
    contractor.errors.should be_empty
  end

  describe "should have the correct photos" do
    before do
      contractor.photos << photo
    end

    specify "first photo" do
      contractor.photos.should include(photo)
    end

    it "should have one photo" do
      contractor.photos.count.should be 1
    end

    it "saves the correct photo" do
      photo = contractor.photos.first
      photo.image_url.should eq "contractor_default.jpg"
    end
  end

  describe "created as a nested attribute of a homeowner" do

  end

end
