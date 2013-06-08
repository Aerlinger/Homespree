require "spec_helper"

describe StaticPagesController do
  it "should respond to root" do
    get("home").should route_to("static_pages#home")
  end

  it "should respond to /about" do
    get("about").should route_to("static_pages#about")
  end

  it "should respond to /faqs" do
    get("faqs").should route_to("static_pages#faqs")
  end

  it "should respond to /how_it_works" do
    get("how_it_works").should route_to("static_pages#how_it_works")
  end

  it "should respond to /jobs" do
    get("jobs").should route_to("static_pages#jobs")
  end

  it "should respond to /contact" do
    get("contact").should route_to("static_pages#contact")
  end
end