require 'spec_helper'
include Warden::Test::Helpers

describe "Contractor Sign Up" do
  let(:contractor) { FactoryGirl.build :contractor }

  subject { page }

  before do
    visit new_contractor_registration_path
    fill_in "Password", with: contractor.password
    fill_in "Company title", with: contractor.company_title
  end

  describe "with valid params" do
    before do
      fill_in "Email", with: contractor.email
      click_button "Create profile"
    end

    its(:status_code) { should eq 200 }
    it { should have_content "Edit" }
    it { should have_content "Insured up to: Add" }
    it { should have_content "Bonded for: Add" }
    it { should have_content "Account Settings" }
    it { should have_no_content "Sign Up" }

    describe "can sign in again after signing up" do
      before do
        click_link "Sign out"
      end

      it { should have_content "Signed out successfully" }
      its(:current_path) { should eq "/" }
      it { should have_no_content "Account Settings" }
    end
  end

  describe "with incomplete parameters" do
    before do
      fill_in "Email", with: "nonsense"
      click_button "Create profile"
    end

    its(:current_path) { should eq "/contractors" }
    it { should have_content("is invalid") }
    it { should have_content("Join Homespree as a Professional") }
  end

end