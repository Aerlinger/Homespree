require 'spec_helper'

describe "Home page" do

  before :all do
    visit root_path
  end

  subject { page }

  describe "submitting an email from the home page" do
    it "should submit to create" do
      fill_in "email_signup", with: "testmailinglist@rspec.com"
      click_link "Homeowner"
      click_button "submit_location"
      current_path.should eq "/mailinglist/create"
    end
  end

end