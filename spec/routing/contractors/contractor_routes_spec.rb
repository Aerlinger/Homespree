require "spec_helper"

describe ContractorsController do
  it "shows profile" do
    get("/contractors/1").should route_to("contractors#show", id: "1")
  end

  context "put" do
    it "updates through :put" do
      put("/contractors/1").should route_to("contractors#update", id: "1")
    end
  end

end
