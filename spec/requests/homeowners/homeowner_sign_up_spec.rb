require 'spec_helper'

describe "Homeowner Sign Up" do
  let(:homeowner) { FactoryGirl.build :homeowner }

  subject { page }

  before do
    visit new_homeowner_registration_path
    #fill_in "Password", with: homeowner.password
  end

  its(:current_path) { should eq "/homeowners/sign_up" }

  describe "with valid params" do
    before do
      fill_in "Email", with: homeowner.email
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
    its(:current_path) { should eq "/homeowner/sign_up" }
    it { should have_content("is invalid") }
  end
end