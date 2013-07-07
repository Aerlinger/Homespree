require "spec_helper"

describe Users::DashboardController, pending: true do
  context "get" do

    it "shows notifications" do
      get("notifications").should route_to("users/dashboard#notifications")
    end

    it "shows projects" do
      get("my_projects").should route_to("users/dashboard#my_projects")
    end

    it "shows inbox" do
      get("inbox").should route_to("users/dashboard#inbox")
    end

    it "shows settings" do
      get("general_settings").should route_to("users/dashboard#general_settings")
    end

    it "shows settings" do
      get("my_income").should route_to("users/dashboard#my_income")
    end

    it "shows material calculator" do
      get("material_calculator").should route_to("users/dashboard#material_calculator")
    end
  end
end