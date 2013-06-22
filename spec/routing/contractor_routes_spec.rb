require "spec_helper"

describe Contractors::RegistrationsController do
  it "routes to /contractors/sign_up => registrations#new" do
    get("/contractors/sign_up").should route_to("contractors/registrations#new")
  end

  it "routes to /contractors/create => registrations#create" do
    post("/contractors").should route_to("contractors/registrations#create")
  end

  it "routes to /contractors/cancel => registrations#cancel" do
    get("/contractors/cancel").should route_to("contractors/registrations#cancel")
  end

  it "routes to /contractors/edit => registrations#edit" do
    get("/contractors/edit").should route_to("contractors/registrations#edit")
  end

  it "routes to /contractors => registrations#edit" do
    put("/contractors/").should route_to("contractors/registrations#update")
  end

  it "routes to /contractors/ => registrations#edit" do
    delete("/contractors/").should route_to("contractors/registrations#destroy")
  end
end

describe Contractors::SessionsController do
  it "handles sign in route" do
    get("/contractors/sign_in").should route_to("contractors/sessions#new")
  end

  it "Creates a new session from sign in" do
    post("/contractors/sign_in").should route_to("contractors/sessions#create")
  end

  it "handles sign out route" do
    get("/contractors/sign_out").should route_to("contractors/sessions#destroy")
  end

end

describe ContractorsController do
  it "should show profile" do
    get("/contractors/1").should route_to("contractors#show", id: "1")
  end

  it "updates through :put" do
    put("/contractors/1").should route_to("contractors#update", id: "1")
  end

  it "index" do
    get("/contractors").should route_to("contractors#index")
  end
end

describe ContractorsController do

  it "shows notifications" do
    get("contractors/1/notifications").should route_to("alerts#index", id: "1")
  end

  it "shows projects" do
    get("contractors/1/projects").should route_to("jobs#index", id: "1")
  end

  it "shows messages" do
    get("contractors/1/messages").should route_to("users/conversations#index", id: "1")
  end

  it "shows settings" do
    get("contractors/1/settings").should route_to("contractors#settings", id: "1")
  end

  it "shows material calculator" do
    get("contractors/1/material_calculator").should route_to("contractors#material_calculator", id: "1")
  end

end
