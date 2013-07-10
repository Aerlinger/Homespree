require "spec_helper"

describe "User sign in" do

  subject { page }

  before do
    visit "/users/sign_in"
    #click_link "Sign In"
  end

  its(:current_path) { should eq "/users/sign_in" }
  it { should have_content "Don't have an account yet? Sign Up" }

  context "Contractor" do
    let(:contractor) { FactoryGirl.create :contractor }

    before do
      fill_in "Email", with: contractor.email
      fill_in "Password", with: contractor.password
      save_and_open_page
      click_button "Sign In"
    end

    it "creates a new user" do
      Contractor.all.should include(contractor)
    end

    it "signs up" do
      contractor.should be_persisted
    end

    it "gets routed to their profile" do
      page.should have_content("Edit")
    end

    describe "with invalid params" do
    end
  end

  context "for Homeowner" do
    let(:homeowner) { FactoryGirl.create :homeowner }

    before do
      visit new_user_session_path

      within(:css, ".body") do
        fill_in "Email", with: homeowner.email
        fill_in "Password", with: homeowner.password
      end
    end

    specify do
      homeowner.password == "iamsecret"
    end

    specify do
      homeowner.email.should include("homeowner")
    end

    it "creates a new user" do
      Homeowner.all.should include(homeowner)
    end

    it { should have_content "Don't have an account yet?" }
    it { should have_content "Sign in to your Homespree account" }
    its(:current_path) { should eq "/users/sign_in" }

    describe "with valid params" do
      before do
        #within(:css, ".body") do
          fill_in "Email", with: homeowner.email
          fill_in "Password", with: homeowner.password
          save_and_open_page
          click_button "Sign In"
        #end
      end

      it { should have_content(homeowner.email)}
      it { should have_content(homeowner.name)}
    end

    describe "with erroneous params" do
    end
  end
end