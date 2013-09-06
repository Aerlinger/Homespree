require 'spec_helper'

describe "Homeowner profile" do
  let(:homeowner) { FactoryGirl.create(:homeowner) }
  before {
    @request = ActionController::TestRequest.new
  }

  describe "When not signed in" do
    let(:contractor) { FactoryGirl.create :contractor }
    it "renders contractor profile" do
      visit "/contractors/#{contractor.id}"
      page.should_not have_text("Edit")
    end

    it "handles request correctly" do
      visit "/contractors/#{contractor.id}?params=5"
    end
  end
end
