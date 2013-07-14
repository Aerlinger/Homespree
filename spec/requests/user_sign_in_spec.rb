require "spec_helper"

describe "User sign in" do
  subject { page }
  before do
    visit "/users/sign_in"
  end

  its(:current_path) { should eq "/users/sign_in" }
  it { should have_content "Don't have an account yet? Sign Up" }

  context "Contractor" do
    let(:contractor) { FactoryGirl.create :contractor }

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

    it "gets routed to their profile" do
      page.should have_content("Edit")
    end

    describe "with invalid params"
  end

  context "for Homeowner", pending: true do
    let(:homeowner) { FactoryGirl.create :homeowner }

    its(:current_path) { should eq "/users/sign_in" }
    it { should have_content "Don't have an account yet?" }
    it { should have_content "Sign in to your Homespree account" }

    describe "with valid params" do
      before do
        @homeowner = sign_up_homeowner
        #sign_out

        visit new_user_session_path

        fill_in "Email", with: @homeowner.email
        fill_in "Password", with: @homeowner.password
        click_button "Sign In"
      end

      it { should have_content(@homeowner.email) }
      it { should have_content(@homeowner.name) }
    end

    describe "with erroneous params" do
    end
  end
end