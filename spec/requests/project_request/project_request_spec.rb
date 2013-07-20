require 'spec_helper'

describe "Project Wizard", js: true do
  subject { page }

  before(:all) do
    ProjectType.find_or_create_by_name "Interior painting"
    ProjectType.find_or_create_by_name "Exterior painting"
  end

  before do
    visit "/"
    select('Interior painting', from: "project_project_type_id")
    fill_in 'zipcode', with: '10025'
  end

  it { should have_content "Stress-free home improvement." }

  describe "Request" do
    before { click_button "Get started" }

    it { should have_content "Interior painting" }
    it { should have_content "previous" }
    its(:current_path) { should eq "/project_wizard/request" }

    it "has dynamic input controls for the interior project"
    it "updates fields on when project type is changed"

    describe "Review Estimate" do
      before { click_button "next"}

      its(:current_path) { should eq "/project_wizard/review_estimates" }
      it { should have_content "Review Estimates" }

      describe "Set appointment" do
        before { click_link "next" }

        its(:current_path) { should eq "/project_wizard/appointment" }
        it { should have_content "Appointment" }

        describe "Submit project" do
          before { click_button "next" }

          its(:current_path) { should eq "/homeowners/projects/1" }
        end
      end
    end
  end
end