require 'spec_helper'

describe "Step 3: Confirm Appointment" do

  let(:project) { FactoryGirl.create :project }

  before { visit project_submission_path("appointment") }

  subject { page }

  it "has select box for project selection"

  it "has box for zipcode"

  it "has box for project selection"

  it "has button to upload pictures"

end