require 'spec_helper'

describe "Homeowner profile" do

  let(:homeowner) { FactoryGirl.create(:homeowner) }

  describe "When not signed in" do
    it "should render contractor profile" do
      c = FactoryGirl.create(:contractor)

      visit "/contractors/#{c.id}"

      page.should_not have_text("Edit")
    end
  end

end