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
  let(:photo) { FactoryGirl.create(:photo) }
  let(:contractor) { FactoryGirl.create(:contractor) }

  subject { photo }

  before do
    contractor.photos = []
    contractor.save
  end

  it { should respond_to :photographable_id }
  it { should respond_to :image_url }
  it { should respond_to :caption }
  it { should respond_to :name }

  it { should validate_presence_of :image_url }
  it { should be_valid }

  context "belongs to contractor as photographable" do
    subject { contractor }

    it { should be_persisted}
    its(:photos) { should be_empty}

    describe "adds a photo" do
      before do
        contractor.photos << photo
      end

      its(:photos) { should eq [photo] }

      it "saves the correct photo" do
        photo = contractor.photos.first
        photo.image_url.should eq "contractor_default.jpg"
      end
    end
  end
end
