require 'spec_helper'

describe "Contractor Wizard" do

  before { visit new_contractor_registration_path }
  subject { page }

  it "should render sign up page" do
    page.should have_text("Create your contractor profile")
  end

  describe "Fill in first page (Essential Info) with valid information" do
    before do
      fill_in "Email", with: "joe@rspec.com"
      fill_in "Company_title", with: "Plumber"

      fill_in "Password", with: "iamsecret"

      click "Sign up"
    end

    it "should allow the next page" do
      page.should have_text("Tell us about yourself")
    end
  end


end