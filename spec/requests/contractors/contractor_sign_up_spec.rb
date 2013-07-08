require 'spec_helper'

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
  end

  describe "with incomplete parameters" do
    before do
      fill_in "Email", with: "nonsense"
      click_button "Create profile"
    end

    its(:current_path) { should eq "/contractors" }
    it { should have_content("is invalid") }
    it { should have_content("Create Contractor Profile") }
  end
end