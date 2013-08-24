require 'spec_helper'

describe 'Project Wizard', js: false do
  subject { page }

  before :each do
    ProjectType.find_or_create_by(name: 'Interior painting')
    ProjectType.find_or_create_by(name: 'Exterior painting')

    visit '/'
    select('Interior painting', from: 'project_project_type_id')
    fill_in 'zipcode', with: '10025'
  end

  it { should have_content 'Stress-free home improvement' }

  describe 'Page 1: Request' do
    before(:each) { click_button 'Get started' }

    its(:current_path) { should eq '/project_wizard/request' }

    it { should have_content 'Interior painting' }

    it { should_not have_content 'previous' }

    it 'has dynamic input controls for the interior project'
    it 'updates fields on when project type is changed'

    describe 'Page 2: Review Estimate' do
      before do
        fill_in "Width in feet", with: '10'
        fill_in "Height in feet", with: '20'
        fill_in "Length in feet", with: '30'

        fill_in "Number of doors to be painted", with: '2'
        fill_in "Number of windows to be painted", with: '2'
        fill_in "Paint ceiling?", with: 'yes'

        # TODO: Select trim to be painted

        #select()

        click_button 'Submit Project Request'
      end

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