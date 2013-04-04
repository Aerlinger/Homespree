require 'spec_helper'

describe "Contractor Wizard Contact Details page" do

  before :each do
    @contractor = sign_up_contractor
  end

  subject { page }

  it "should be on Contact Details page after a new user signs up" do
    current_path.should eq "/contractors/wizard/contact_details"
  end


  describe "Populate with proper data" do
    before do
      fill_in "First name", with: "Joe"
      fill_in "Last name", with: "Smith"

      fill_in "Mobile number", with: "(877) 450-2339"
      fill_in "Office number", with: "855-450-2330"

      click_button "Continue"
    end

    it "should redirect to location_details pagge" do
      current_path.should eq "/contractors/wizard/location_details"
    end
  end


  describe "click 'complete this step later'" do
    before { click_link "skip" }

    it "should be on correct page" do
      current_path.should eq "/contractors/wizard/location_details"
    end

    describe "click skip this test again" do
      before { click_link "skip" }
      its(:current_path) { should eq "/contractors/profiles/#{@contractor.id}" }
    end
  end
end