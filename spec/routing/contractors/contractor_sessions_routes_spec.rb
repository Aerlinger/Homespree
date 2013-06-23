require 'spec_helper'

describe Contractors::SessionsController do
  context "GET" do
    it "handles sign in route" do
      get("/contractors/sign_in").should route_to("contractors/sessions#new")
    end

    it "handles sign out route" do
      get("/contractors/sign_out").should route_to("contractors/sessions#destroy")
    end
  end

  context "POST" do
    it "Creates a new session from sign in" do
      post("/contractors/sign_in").should route_to("contractors/sessions#create")
    end
  end

end