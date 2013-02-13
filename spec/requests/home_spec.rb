require 'spec_helper'

describe "Home page" do

  before :all do
    visit root_path
  end

  subject { page }

  it "should have top nav"

  it "should have footer"

  it "should have email submission"

  it { should have_selector("title") }

end