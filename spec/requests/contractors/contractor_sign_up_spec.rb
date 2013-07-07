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

    its(:status_code) { should eq 422 }
    its(:current_path) { should eq new_contractor_registration_path }
    it { should have_content("is invalid") }
  end
end