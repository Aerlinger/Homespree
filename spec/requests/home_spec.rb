require 'spec_helper'

describe "Home page" do

  before :all do
    visit root_path
  end

  subject { page }

  #it { should have_selector(".navbar.navbar-fixed-top") }
  #
  #it { should have_selector("footer.footer-box") }
  #
  #it { should have_selector("title", :text => "Homespree | The smart way to get home improvement estimates") }

end