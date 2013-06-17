require 'spec_helper'

describe 'Contractor Profile' do

  let(:contractor) { FactoryGirl.build :contractor }
  subject { page }

  # Sign in from scratch:
  before :each do
    visit new_contractor_registration_path

    fill_in "Company title", with: contractor.company_title
    fill_in "Email", with: contractor.email
    fill_in "Password", with: contractor.password
    click_button "Create profile"
  end

  describe "default address without geolocation" do
    subject { contractor.address }
    its(:city) { should eq "New York" }
    its(:state) { should eq "NY" }
  end

  subject { page }

  it { page.status_code.should be 200 }
  its(:current_path) { should eq "/contractors/#{contractor.slug}" }

  it "should not have any errors" do
    contractor.errors.should be_empty
  end

  its(:address) { should_not be_nil }

  describe "has header links for" do

    specify "Settings" do
      click_link "Settings"
      page.current_path.should include("edit")
    end

    specify "Messages" do
      click_link "Messages"
      page.current_path.should include("message")
    end

    specify "My projects" do
      find_link("My Projects").should be_visible
      page.current_path.should include("project")
    end


    describe "Sign out" do
      before do
        click_link "Sign out"
      end

      its(:current_path) { should eq root_path }
    end
  end

  describe "left hand contractor card" do

    specify "populated fields" do
      within(:css, ".wrapper") do
        page.should have_text contractor.company_title
        page.should have_text contractor.city
        page.should have_text contractor.state
        page.should have_text contractor.first_name
        page.should have_text number_to_phone(contractor.mobile_number)
        page.should have_text contractor.bonding_limit
        page.should have_text contractor.insurance_limit
        page.should have_text contractor.license
      end
    end

  end

  describe "portfolio images" do

  end

  describe "Business description" do
    it "has description and slogan" do
      page.should have_text contractor.slogan
      page.should have_text contractor.description
    end
  end

  describe "address" do
    it "has city and state" do
      within(:css, "#service_area") do
        page.should have_content contractor.city
        page.should have_content contractor.state
        page.should have_content contractor.zipcode
      end
    end
  end


end