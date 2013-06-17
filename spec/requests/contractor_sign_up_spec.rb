require 'spec_helper'


describe "Contractor Sign Up" do
  subject { page }

  let(:contractor) { FactoryGirl.build :contractor }

  #it { should have_content("Create your contractor profile") }

  describe "with valid params" do

    before do
      visit "/contractors/sign_up"

      fill_in "Email", with: contractor.email
      fill_in "Company title", with: contractor.company_title
      fill_in "Password", with: contractor.password
      click_button "Create profile"
    end

    it "Should redirect to a valid page" do
      page.status_code.should be 200
    end

    it "display contractors title" do
      page.has_content?(contractor.company_title)
    end

    it "displays edit links" do
      page.has_content?("Edit")
    end

  end

  describe "with incomplete parameters" do
    before do
      visit "/contractors/sign_up"

      fill_in "Email", with: "nonsense"
      fill_in "Company title", with: contractor.company_title
      fill_in "Password", with: contractor.password
      click_button "Create profile"
    end

    it "should display unprocessable entity (422)"
  end

end