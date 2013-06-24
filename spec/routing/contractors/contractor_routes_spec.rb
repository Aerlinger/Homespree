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
      get("notifications").should route_to("contractors/dashboard#notifications")
    end

    it "shows projects" do
      get("my_projects").should route_to("contractors/dashboard#my_projects")
    end

    it "shows inbox" do
      get("inbox").should route_to("contractors/dashboard#inbox")
    end

    it "shows settings" do
      get("general_settings").should route_to("contractors/dashboard#general_settings")
    end

    it "shows settings" do
      get("my_income").should route_to("contractors/dashboard#my_income")
    end

    it "shows material calculator" do
      get("material_calculator").should route_to("contractors/dashboard#material_calculator")
    end
  end

  context "put" do
    it "updates through :put" do
      put("/contractors/1").should route_to("contractors#update", id: "1")
    end
  end

end
