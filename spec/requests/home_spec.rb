require 'spec_helper'

describe "Home page" do

  before :all do
    visit root_path
  end

  subject { page }

  describe "submitting an email from the home page" do
    it "should raise invalid record when submitted with incomplete info" do
      expect {
        fill_in "email_signup", with: "testmailinglist@rspec.com"
        #click_button "Homeowner"
        click_button "submit_location"
      }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end

end