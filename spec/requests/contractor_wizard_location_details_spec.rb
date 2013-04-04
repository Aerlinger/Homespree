require 'spec_helper'

describe "Contractor Wizard Location Details", type: :request do

  before :each do
    @example_contractor = sign_up_contractor
    click_link "skip"
  end

  subject { page }

  it "should go to /contractors/wizard/location_details" do
    current_path.should eq "/contractors/wizard/location_details"
  end

  describe "On Location Details page" do
    before do
      fill_in "Slogan", with: @example_contractor.slogan
      fill_in "Description", with: @example_contractor.description
      fill_in "Website", with: @example_contractor.website
    end

    describe "Click skip this step" do
      before { click_link "skip" }

      it "should be on correct page" do
        current_path.should eq "/contractors/profiles/#{@example_contractor.id}"
      end
    end

    describe "Click the continue button" do
      before { click_link "Continue" }

      it "should have the correct data"
    end

  end
end