
require "spec_helper"

describe "User sign in" do
  let(:contractor) { FactoryGirl.create :contractor }
  let(:homeowner) { FactoryGirl.create :homeowner }

  before do
    visit "/"
    click_link "Sign In"
  end

  it "navigates to login" do
    current_path.should eq "/contractors/sign_in"
  end

  it "shows form data" do
    page.should have_content "Don't have an account yet? Sign Up"
  end

  context "Contractor" do
    before do
      fill_in "Email", with: contractor.email
      fill_in "Password", with: contractor.password

      click_button "Sign In"
    end

    it "creates a new user" do
      Contractor.all.should include(contractor)
    end

    it "signs up" do
      contractor.should be_persisted
    end

    it "signs up" do
      contractor.user_type.should eq "Contractor"
    end

    it "gets routed to their profile" do

    end

    describe "sends erroneous data"

  end

  context "Homeowner" do
    before do
      visit new_homeowner_registration_path

      fill_in "Email", with: homeowner.email
      fill_in "Password", with: homeowner.password

      click_button "Sign In"
    end

    xit "creates a new user" do
      Homeowner.all.should include(homeowner)
    end

    xit "signs up" do
      homeowner.should be_persisted
    end

    xit "gets routed to their profile" do

    end

    xit "signs up" do
      homeowner.user_type.should eq "Homeowner"
    end

    describe "sends erroneous data"
  end

end