require 'spec_helper'

describe "Home page" do
  subject { page }

  before do
    visit root_path
  end

  describe "not signed in" do
    it "shows sign up link" do
      click_link "Sign Up"
    end

    it "shows sign in link" do
      click_link "Sign In"
    end
  end

  describe "when signed in as homeowner", pending: true do
    let(:homeowner) { FactoryGirl.create :homeowner }
    before do
      visit new_user_session_path

      fill_in  "user_email", with: homeowner.email
      fill_in  "user_password", with: "iamsecret"
      click_button "Sign In"
    end

    it { should_not have_text "Invalid" }
    it { should have_text "Settings" }
    it { should have_text "Messages" }
    it { should have_text homeowner.first_name }
  end

  describe "when signed in as contractor", pending: true do
    before do
      user_sign_in FactoryGirl.create(:contractor)
    end

    it { should_not have_text "Invalid" }

    it "has link for account" do
      page.find_link("Account Settings").should be_visible
    end
  end

end