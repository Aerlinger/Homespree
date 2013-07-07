require 'spec_helper'

describe Homeowners::SessionsController do
  it "handles sign in route" do
    get("/homeowners/sign_in").should route_to("homeowners/sessions#new")
  end

  it "Creates a new session from sign in" do
    post("/homeowners/sign_in").should route_to("homeowners/sessions#create")
  end

  it "handles sign out route" do
    get("/homeowners/sign_out").should route_to("homeowners/sessions#destroy")
  end

end
