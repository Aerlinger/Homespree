require 'spec_helper'


describe "Contractor Wizard" do

  before do
    @contractor = FactoryGirl.create :contractor
    visit "/contractors/wizard/contact_details"
  end

  subject { FactoryGirl.create :contractor }


  describe "Populate with proper data", js: true do

    before do
      fill_in :first_name, with: contactor.first_name
      fill_in :last_name, with: contactor.last_name

      fill_in :mobile_number, with: "(877) 450-2339"
      fill_in :office_number, with: "855-450-2330"

      #Todo fill in specialties

      click_button "Update Profile"
    end

    describe "updates the contractor" do

    end

  end

end