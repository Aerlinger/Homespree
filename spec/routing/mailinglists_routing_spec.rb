require "spec_helper"

describe MailinglistsController do


  describe "routing" do

    before :each do
      #request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "Meetmike")
    end

    it "routes to #index" do
      get("/mailinglists").should route_to("mailinglists#index")
    end

    it "routes to #new" do
      get("/mailinglists/new").should route_to("mailinglists#new")
    end

    it "routes to #show" do
      get("/mailinglists/1").should route_to("mailinglists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mailinglists/1/edit").should route_to("mailinglists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mailinglists").should route_to("mailinglists#create")
    end

    it "routes to #update" do
      put("/mailinglists/1").should route_to("mailinglists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mailinglists/1").should route_to("mailinglists#destroy", :id => "1")
    end

  end
end
