require "spec_helper"

describe ContractorsController do
  it "should show profile" do
    get("/contractors/1").should route_to("contractors#show", id: "1")
  end

  context "get" do
    it "index" do
      get("/contractors").should route_to("contractors#index")
    end

    it "shows notifications" do
      get("contractors/1/notifications").should route_to("contractors/dashboard#notifications", id: "1")
    end

    it "shows projects" do
      get("contractors/1/my_projects").should route_to("contractors/dashboard#my_projects", id: "1")
    end

    it "shows inbox" do
      get("contractors/1/inbox").should route_to("contractors/dashboard#inbox", id: "1")
    end

    it "shows settings" do
      get("contractors/1/general").should route_to("contractors/dashboard#general_settings", id: "1")
    end

    it "shows settings" do
      get("contractors/1/my_income").should route_to("contractors/dashboard#my_income", id: "1")
    end

    it "shows material calculator" do
      get("contractors/1/material_calculator").should route_to("contractors/dashboard#material_calculator", id: "1")
    end
  end

  context "put" do
    it "updates through :put" do
      put("/contractors/1").should route_to("contractors#update", id: "1")
    end
  end

end
