require 'spec_helper'

describe "Home page" do

  before :all do
    visit root_path
  end

  subject { page }

  #it { should have_selector(".navbar") }

  describe "submitting an email from the home page" do
    before do
      fill_in "email_signup", with: "testmailinglist@rspec.com"
      click_link "dropdown"
      #click_link "homeowner"
      click_button "submit_location"
    end

    its(:current_path) { should eq "/mailinglist/create" }
  end

end