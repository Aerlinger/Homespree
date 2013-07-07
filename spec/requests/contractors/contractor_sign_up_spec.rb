require 'spec_helper'

describe "Contractor Sign Up" do
  let(:contractor) { FactoryGirl.build :contractor }

  subject { page }

  describe "with valid params" do
    before do
      visit new_contractor_registration_path

      fill_in "Email", with: contractor.email
      fill_in "Company title", with: contractor.company_title
      fill_in "Password", with: contractor.password
      click_button "Create profile"
    end

    its(:status_code) { should eq 200 }
    it { should have_content "Edit" }
  end

  describe "with incomplete parameters" do
    before do
      visit "/contractors/sign_up"

      fill_in "Email", with: "nonsense"
      fill_in "Company title", with: contractor.company_title
      fill_in "Password", with: contractor.password
      click_button "Create profile"
    end

    its(:status_code) { should eq 422 }
    its(:current_path) { should eq "/contractors/sign_up" }
    it { should have_content("is invalid") }
  end
end