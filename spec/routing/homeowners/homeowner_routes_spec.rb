require 'spec_helper'

describe Homeowners do
  xit "should show profile" do
    get("/homeowners/1").should route_to("homeowners#show", id: "1")
  end
end