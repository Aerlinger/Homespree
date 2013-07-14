require 'spec_helper'

describe "Project request", pending: true do
  let(:project) { FactoryGirl.create :project }
  let(:project_type) { FactoryGirl.create :project_type }

  before do
    visit projects_path(id: "request", project_id: project.id)
  end

  it "routes to request page" do
    page.should have_text(project.project_type)

    # Fill in form fields here
  end

  describe "click next on request page" do
    before { click_button 'next' }

    it "routes to review estimages" do
      page.should have_text("Review Estimates")
      page.should have_text("2")
    end

    describe "click next on review estimates" do
      before { click_button 'next' }

      it "routes to appointment.haml" do
        page.should have_text("Appointment")
        page.should have_text("3")
      end

      describe "click next on Appointment" do
        before { click_button 'next' }

        it "routes to submit.haml" do
          page.should have_text("Submit")
          page.should have_text("4")
        end
      end
    end
  end
end