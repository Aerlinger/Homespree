require 'spec_helper'

describe "Contractor Wizard Location Details", type: :request do

  before :each do
    @example_contractor = sign_up_contractor
    @form_contractor = Contractor.find_by_email @example_contractor.email

    get "/contractors/wizard/contact_details"
    click_link 'skip this step'
  end

  subject { page }

  it "should go to /contractors/wizard/location_details" do
    response.should render_template('contractors/wizard/location_details')
  end

  it "should render valid response" do
    response.status.should be(200)
  end


  describe "On Location Details page" do
    before do
      fill_in "Slogan", with: @example_contractor.slogan
      fill_in "Description", with: @example_contractor.description
      fill_in "Website", with: @example_contractor.website
    end

    describe "Click skip this step" do
      before { click_link "skip this step" }

      it "should be on correct page" do
        current_path.should eq "/contractors/profiles/1"
      end
    end

    describe "Click the continue button" do
      before { click_link "Continue" }

      it "should have the correct data"
    end

  end
end