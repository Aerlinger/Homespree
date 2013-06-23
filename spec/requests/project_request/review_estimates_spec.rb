require 'spec_helper'

describe "STEP 2: Review Estimates" do
  let(:project) { FactoryGirl.create :project }

  before { visit project_submission_path("review_estimates") }
end
