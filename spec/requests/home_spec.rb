require 'spec_helper'

describe "Home page" do

  subject { page }

  before do
    visit root_path
  end

  describe "shows project submission form" do


  end

  describe "not signed in" do
    it "shows sign up link" do
      click_link "Sign Up"
    end

    it "shows sign in link" do
      click_link "Sign In"
    end
  end

  describe "when signed in as homeowner" do

  end

  describe "when signed in as contractor" do
    before do
      sign_in_contractor FactoryGirl.create(:contractor)
    end
    page.should.find_link("My account")
  end

  describe "submitting a project from the home page" do
    before do
      #click_link "Power Washing"
      fill_in "email_signup", with: "10025"
      click_button "submit_location"
    end

    it "navigates to project request" do
      it "should have request title" do

      end
    end

    xit "creates a new guest homeowner"  do

    end


  end

end