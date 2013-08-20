require 'spec_helper'

describe "Homeowner Sign Up" do
  let(:homeowner) { FactoryGirl.build :homeowner }

  subject { page }

  before do
    visit new_homeowner_registration_path
    fill_in "Password", with: homeowner.password
  end

  its(:current_path) { should eq "/homeowners/sign_up" }

  describe "with valid params" do
    before do
      fill_in "Email", with: homeowner.email
      click_button "Create profile"
    end

    its(:status_code) { should eq 200 }

    describe "and visit homepage" do
      before do
        ProjectType.find_or_create_by(name: 'Interior painting')
        ProjectType.find_or_create_by(name: 'Exterior painting')

        visit '/'
        select('Interior painting', from: 'project_project_type_id')
        fill_in 'zipcode', with: '10025'
      end

      it { should have_content 'Stress-free home improvement' }

      it 'takes logged in user through the project wizard' do
        click_button 'Get started'

        current_path.should eq '/project_wizard/request'
      end
    end
  end

  describe "with incomplete parameters" do
    before do
      fill_in "Email", with: "nonsense"
      click_button "Create profile"
    end

    its(:status_code) { should eq 200 }
    its(:current_path) { should eq "/homeowners" }
    it { should have_content("is invalid") }
  end
end