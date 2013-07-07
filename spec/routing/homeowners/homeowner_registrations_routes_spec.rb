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