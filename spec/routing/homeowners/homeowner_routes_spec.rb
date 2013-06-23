require "spec_helper"

describe Homeowners::RegistrationsController do
  it "routes to /homeowners/sign_up => registrations#new" do
    get("/homeowners/sign_up").should route_to("homeowners/registrations#new")
  end

  it "routes to /homeowners/create => registrations#create" do
    post("/homeowners").should route_to("homeowners/registrations#create")
  end

  it "routes to /homeowners/cancel => registrations#cancel" do
    get("/homeowners/cancel").should route_to("homeowners/registrations#cancel")
  end

  it "routes to /homeowners/edit => registrations#edit" do
    get("/homeowners/edit").should route_to("homeowners/registrations#edit")
  end

  it "routes to /homeowners => registrations#edit" do
    put("/homeowners/").should route_to("homeowners/registrations#update")
  end

  it "routes to /homeowners/ => registrations#edit" do
    delete("/homeowners/").should route_to("homeowners/registrations#destroy")
  end
end

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

describe Homeowners do
  it "should show profile" do
    get("/homeowners/1").should route_to("homeowners#show", id: "1")
  end

  it "should index" do
    get("/homeowners").should route_to("homeowners#index")
  end
end