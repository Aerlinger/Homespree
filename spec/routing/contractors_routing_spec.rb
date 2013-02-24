require "spec_helper"

describe ContractorsController do
  describe "routing" do

    it "routes to #index" do
      get("/contractors").should route_to("contractors#index")
    end

    it "routes to #new" do
      get("/contractors/new").should route_to("contractors#new")
    end

    it "routes to #show" do
      get("/contractors/1").should route_to("contractors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contractors/1/edit").should route_to("contractors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contractors").should route_to("contractors#create")
    end

    it "routes to #update" do
      put("/contractors/1").should route_to("contractors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contractors/1").should route_to("contractors#destroy", :id => "1")
    end

  end
end
