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

    @contractor = Contractor.find_by_email(contractor.email)
  end

  describe "default address without geolocation" do
    subject { @contractor.address }
    its(:city) { should eq "New York" }
    its(:state) { should eq "NY" }
  end

  subject { page }

  its(:status_code) { status_code.should be 200 }
  its(:current_path) { should eq "/contractors/#{@contractor.slug}" }

  it "should create a valid contractor" do
    @contractor.should be_valid
  end

  it "should create a default address for the contractor" do
    address = @contractor.address
    address.city.should_not be_empty
    address.zipcode.should be_present
    address.state.should be_present
  end

  it "should not have any errors" do
    @contractor.errors.should be_empty
  end

  describe "has header links for" do

    specify "Settings" do
      click_link "Settings"
    end

    specify "Messages" do
      click_link "My Messages"
    end

    specify "My projects" do
      click_link "My Projects"
    end

    describe "Sign out" do
      before do
        click_link "Sign out"
      end

      its(:current_path) { should eq root_path }
    end
  end


  describe "viewing own profile" do
    describe "left hand contractor card" do
      specify "populated fields" do
        within(:css, ".wrapper") do
          page.should have_text @contractor.company_title
          page.should have_text @contractor.city
          page.should have_text @contractor.state
          page.should have_text @contractor.first_name
          page.should have_text @contractor.bonding_limit
          page.should have_text @contractor.insurance_limit
          page.should have_text @contractor.license
        end
      end

    end

    describe "portfolio images" do

    end

    describe "Business description" do
      it "has description and slogan" do
        page.should have_text @contractor.slogan
        page.should have_text @contractor.description
      end
    end

    describe "address" do
      it "has city and state" do
        within(:css, "#service_area") do
          page.should have_content @contractor.city
        end
      end
    end
  end


  describe "viewing another contractor's profile" do
    let(:contractor2) { FactoryGirl.create :contractor }
    before do
      visit "/contractors/#{contractor2.id}"
    end

    it "shows other contractor's name" do
      page.should have_content contractor2.company_title
    end

    it "shows other contractor's name" do
      page.should have_content contractor2.first_name
    end

    describe "Does not show" do

      it "edit links" do
        page.current_path.should eq "/contractors/#{contractor2.id}"
      end

      it "submit button for address" do
        page.should_not have_content("Update Location")
      end

      it "Add services links" do
        page.should_not have_content("Add")
      end

      it "Draggable services" do
        page.should_not have_content("Drag services")
      end

      it "Should not have upload button" do

      end

    end
  end

end

