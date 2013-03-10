require 'spec_helper'

describe "Contractor Wizard" do

  before { visit new_contractor_path }
  subject { page }

  it { should have_selector('title', text: "Create your contractor profile") }

  describe "Fill in first page (Essential Info) with valid information" do
    before do
      fill_in "First Name", with: "Joe"
      fill_in "Last Name", with: "Plumber"
      fill_in "Business Title", with: "Joe's Plumbing"

      fill_in "Email", with: "joe@plumber.com"
      fill_in "Password", with: "iamsecret"
      fill_in "Password confirmation", with: "iamsecret"
    end

    it "should allow the next page"
  end


  describe "Fill in first page (Essential Info) with INVALID information: " do
    before do
      fill_in "First Name", with: "Joe"
      fill_in "Last Name", with: "Plumber"
      fill_in "Business Title", with: "Joe's Plumbing"
    end

    describe "no email or password" do
      it "should not allow the next page"
    end

    describe "non-matching password" do
      before do
        fill_in "Password", with: "iamthesecret"
        fill_in "Password confirmation", with: "iamsecret"
      end

      it "should not allow the next page"
    end

    describe "too short of a password" do
    end

    describe "invalid emails" do
      before do
        fill_in "Password", with: "iamsecret"
        fill_in "Password confirmation", with: "iamsecret"
        fill_in "Email", with: "joe.joe.com"
      end

      it "should not allow the next page"
    end

  end

end