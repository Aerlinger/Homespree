require "spec_helper"

describe MailinglistsController do
  it "routes to #create" do
    post("/mailinglist/create").should route_to("mailinglists#create")
  end

  it "routes to #unsubscribe" do
    get("/mailinglist/unsubscribe/asdf").should route_to("mailinglists#unsubscribe", email: "asdf")
  end

  it "routes to #delete" do
    delete("/mailinglist/destroy/asdf").should route_to("mailinglists#destroy", email: "asdf")
  end
end