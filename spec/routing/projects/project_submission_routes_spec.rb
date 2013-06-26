require 'spec_helper'

describe ProjectWizardController do

  it "routes to request" do
    get("project_wizard/request").should route_to("project_wizard#show", id: "request")
  end

  it "routes to review estimates" do
    get("project_wizard/review_estimates").should route_to("project_wizard#show", id: "review_estimates")
  end

  it "routes to review appointent" do
    get("project_wizard/appointment").should route_to("project_wizard#show", id: "appointment")
  end

  it "routes to submit" do
    get("project_wizard/submit").should route_to("project_wizard#show", id: "submit")
  end

end