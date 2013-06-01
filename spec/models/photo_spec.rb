require 'spec_helper'

describe Photo do
  it { should respond_to :image_url }
  it { should respond_to :caption }
  it { should respond_to :name }

  let(:contractor) { FactoryGirl.create(:contractor) }

  specify "Newly created contractor has no photos" do
    contractor.photos.should be_empty
  end

  it "Photo gets added to a contractor" do
    contractor.photos.create(FactoryGirl.attributes_for(:photo))

  end

end
