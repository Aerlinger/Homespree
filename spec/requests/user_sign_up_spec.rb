require "spec_helper"

#describe "User sign up" do
#  let(:contractor) { FactoryGirl.build :contractor }
#  let(:homeowner) { FactoryGirl.build :homeowner }
#
#  before do
#    visit "/"
#  end
#
#  it "navigates to login" do
#    current_path.should eq "/users/sign_up"
#  end
#
#
#  context "Contractor" do
#    before do
#      visit new_contractor_registration_path
#
#      fill_in "Email", with: contractor.email
#      fill_in "Company title", with: contractor.company_title
#      fill_in "Password", with: contractor.password
#
#      click_button "Create profile"
#    end
#
#    it "shows form data" do
#      page.should have_content "Already have an account?"
#    end
#
#    it "signs up" do
#      contractor.should be_persisted
#    end
#
#    it "signs up" do
#      contractor.user_type.should eq "Contractor"
#    end
#
#    it "gets routed to their profile" do
#      page.current_path.should eq "/contractors/#{contractor.slug}"
#    end
#
#    describe "sends erroneous data"
#
#  end
#
#  context "Homowner" do
#    before do
#      visit new_homeowner_registration_path
#
#      fill_in "Email", with: homeowner.email
#      fill_in "Password", with: homeowner.password
#
#      click_button "Create profile"
#    end
#
#    it "signs up" do
#      homeowner.should be_persisted
#    end
#
#    it "gets routed to their profile" do
#
#    end
#
#    it "signs up" do
#      homeowner.user_type.should eq "Homeowner"
#    end
#
#    describe "sends erroneous data"
#  end
#
#end