require 'spec_helper'

describe ProjectSubmissionsController do

  it "routes to request" do
    get("project_submissions/request").should route_to("project_submissions#show", id: "request")
    wizard_path.should eq ""
  end

  it "routes to appointment" do
    get("project_submissions/review_estimates").should route_to("project_submissions#show", id: "review_estimate")
  end

  it "routes to review estimate" do
    get("project_submissions/appointment").should route_to("project_submissions#show", id: "appointment")
  end

  it "routes to submit" do
    get("project_submissions/submit").should route_to("project_submissions#show", id: "submit")
  end

end