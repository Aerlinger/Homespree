require "spec_helper"

describe StaticPagesController do
  it "should respond to root" do
    get("/").should route_to("static_pages#home")
  end

  it "should respond to /about" do
    get("/about").should route_to("static_pages#about")
  end

  it "should respond to /homeowners_preview" do
    get("/homeowners_preview").should route_to("static_pages#homeowners")
  end

  it "should respond to /contractors_preview" do
    get("/contractors_preview").should route_to("static_pages#contractors")
  end

  it "should respond to /jobs" do
    get("/jobs").should route_to("static_pages#jobs")
  end

  it "should respond to /contact" do
    get("/contact").should route_to("static_pages#contact")
  end
end