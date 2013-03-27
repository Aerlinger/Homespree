require "spec_helper"

describe Contractors::WizardController do

  it "should route to contact info wizard page" do
    get("/contractors/wizard/contact_info").should route_to("contractors/wizard#show", id: "contact_info")
  end

  it "should route to location info wizard page" do
    get("/contractors/wizard/location_info").should route_to("contractors/wizard#show", id: "location_info")
  end

  it "should route to location info wizard page" do
    get("/contractors/wizard/").should route_to("contractors/wizard#index")
  end

end