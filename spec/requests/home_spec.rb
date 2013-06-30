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
      user_sign_in FactoryGirl.create(:contractor)
    end
    it "should have link for account" do
      page.find_link("Account Settings").should be_visible
    end
  end

end