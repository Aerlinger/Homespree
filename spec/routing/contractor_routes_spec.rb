require "spec_helper"

describe Contractors::RegistrationsController do
  it "routes to #new" do
    get("/contractors/sign_up").should route_to("contractors/registrations#new")
  end
end

describe Contractors::SessionsController do
  it "needs specs"
end

describe Contractors::ProfilesController do
  it "needs specs"
end