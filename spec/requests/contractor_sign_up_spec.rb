require 'spec_helper'


describe "Contractor Sign Up" do
  subject { page }

  before do
    visit "/contractors/sign_up"
  end

  let(:contractor) { FactoryGirl.create :contractor }

  #it { should have_content("Create your contractor profile") }

  describe "with valid params", js: true do

    before do
      fill_in "Email", with: contractor.email
      fill_in "Company title", with: contractor.company_title
      fill_in "Password", with: contractor.password
    end


    #it "should redirect to wizard contractor creation" do
    #  click_button "Sign Up"
    #  page.current_page? "/contractors/wizard/contact_details"
    #  Capybara::Session.current_path == "/contractors/wizard/contact_details"
    #  page.request.current_page? "/contractors/wizard/contact_details"
    #  page.request.fullpath.should eq "/contractors/wizard/contact_details"
    #end

  end

end