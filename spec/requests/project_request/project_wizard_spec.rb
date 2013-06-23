require 'spec_helper'

describe "Project request" do

  let(:project) { FactoryGirl.create :project }

  before { visit project_submission_path(id: "request") }

  it "routes to request page" do
    page.should have_text("Request")
    page.should have_text("1")
  end

  describe "click next on request page" do
    before { click_link 'next' }

    it "routes to review estimages" do
      page.should have_text("Review Estimates")
      page.should have_text("2")
    end

    describe "click next on review estimates" do
      before { click_link 'next' }

      it "routes to appointment.haml" do
        page.should have_text("Appointment")
        page.should have_text("3")
      end

      describe "click next on Appointment" do
        before { click_link 'next' }

        it "routes to submit.haml" do
          page.should have_text("Submit")
          page.should have_text("4")
        end
      end
    end
  end

end