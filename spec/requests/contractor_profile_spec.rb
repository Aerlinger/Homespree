require 'spec_helper'

describe 'Contractor Profile' do

  let(:contractor) { FactoryGirl.create :contractor }

  before :each do
    visit new_contractor_session_path
    fill_in "contractor_email", with: contractor.email
    fill_in "contractor_password", with: contractor.password
    click_button "Sign In"
  end

  subject { page }

  it { page.status_code.should be 200 }
  its(:current_path) { should eq "/contractors/#{contractor.company_title}" }


  describe "has header links for" do
    specify "Settings" do
      click_link "Profile Settings"
    end

    specify "Messages" do
      click_link "Messages"
    end

    specify "My projects" do
      find_link("My projects").should be_visible
    end


    describe "Sign Out" do
      before do
        click_link "Sign out"
      end

      its(:current_path) { should eq root_path }
    end
  end

end