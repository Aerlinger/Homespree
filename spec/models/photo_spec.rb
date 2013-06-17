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

  it "isn't valid without image_url" do

  end

  specify "Newly created contractor has no photos" do
    contractor.photos.should be_empty
  end

  it " gets added to a contractor" do
    contractor.photos.create(FactoryGirl.attributes_for(:photo))
  end

  describe "created as a nested attribute of contractor" do

    let(:params) do
      {
        contractor: FactoryGirl.attributes_for(:contractor),
                    photos_attributes: [
                      FactoryGirl.attributes_for(:photo),
                      FactoryGirl.attributes_for(:photo)
                    ]
      }
    end

    before { @contractor = Contractor.create(params[:contractor]) }

    it "should persist contractor" do
      @contractor.should be_persisted
    end

    it "should have one photo" do
      @contractor.photos.count.should be 2
    end

    it "saves the correct photo" do
      photo = @contractor.photos.first
      photo.image_url.should be "contractor_default.jpg"
    end

  end

end
