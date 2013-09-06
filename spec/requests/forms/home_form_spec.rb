require 'spec_helper'

describe "Project form submission on home page" do
  before { visit "/" }

  it "submits correct params for the form" do
    #select("Interior Painting")
    click_button "Get started"

    capybara_request.should eq ""
  end
end
