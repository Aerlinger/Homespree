require 'spec_helper'

describe ProjectWizardController do

  it "routes to request" do
    get("project_submissions/request").should route_to("project_submissions#show", id: "request")
  end

  it "routes to review estimates" do
    get("project_submissions/review_estimates").should route_to("project_submissions#show", id: "review_estimates")
  end

  it "routes to review appointent" do
    get("project_submissions/appointment").should route_to("project_submissions#show", id: "appointment")
  end

  it "routes to submit" do
    get("project_submissions/submit").should route_to("project_submissions#show", id: "submit")
  end

end