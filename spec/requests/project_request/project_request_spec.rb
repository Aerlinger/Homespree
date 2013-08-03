require 'spec_helper'

describe 'Project Wizard'  do
  subject { page }

  before :each do
    ProjectType.find_or_create_by_name 'Interior painting'
    ProjectType.find_or_create_by_name 'Exterior painting'

    visit '/'
    select('Interior painting', from: 'project_project_type_id')
    fill_in 'zipcode', with: '10025'
  end

  it { should have_content 'Stress-free home improvement' }

  describe 'Page 1: Request' do
    before(:each) { click_button 'Get started' }

    its(:current_path) { should eq '/project_wizard/request' }

    it { should have_content 'Interior painting' }
    it { should have_content 'previous' }

    it 'has dynamic input controls for the interior project'
    it 'updates fields on when project type is changed'

    describe 'Page 2: Review Estimate' do
      before(:each) { click_button 'next'}

      its(:current_path) { should eq '/project_wizard/review_estimates' }
      it { should have_content 'Review Estimates' }

      describe 'Page 3: Set appointment' do
        before(:each) { click_link 'next' }

        its(:current_path) { should eq '/project_wizard/appointment' }
        it { should have_content 'Appointment' }

        describe 'Page 4: Submit project' do
          before(:each) { click_button 'next' }

          its(:current_path) { should match /\/homeowners\/projects\/\d+/ }
        end
      end
    end
  end
end