require "spec_helper"

describe Contractors::RegistrationsController do

  context "GET" do
    it "routes to /contractors/sign_up => registrations#new" do
      get("/contractors/sign_up").should route_to("contractors/registrations#new")
    end

    it "routes to /contractors/cancel => registrations#cancel" do
      get("/contractors/cancel").should route_to("contractors/registrations#cancel")
    end

    it "routes to /contractors/edit => registrations#edit" do
      get("/contractors/edit").should route_to("contractors/registrations#edit")
    end
  end

  context "PUT" do
    it "routes to /contractors => registrations#update" do
      put("/contractors/").should route_to("contractors/registrations#update")
    end
  end

  context "POST" do
    it "routes to /contractors/create => registrations#create" do
      post("/contractors").should route_to("contractors/registrations#create")
    end
  end

  context "DELETE" do
    it "routes to /contractors/ => registrations#destroy" do
      delete("/contractors/").should route_to("contractors/registrations#destroy")
    end
  end

end