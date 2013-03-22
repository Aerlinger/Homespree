require 'spec_helper'

describe "Home page" do

  before :all do
    visit root_path
  end

  subject { page }

  it { should have_selector(".navbar") }
  #its(:title) { should include "Homespree" }
  #it { should have_text "Homespree | The smart way to get home improvement estimates" }


  describe "submitting an email from the home page" do

  end

end