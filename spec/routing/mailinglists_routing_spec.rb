require "spec_helper"

describe MailinglistsController do


  describe "routing" do

    before :each do
      #request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "Meetmike")
    end

    it "routes to #create" do
      post("/mailinglists").should route_to("mailinglists#create")
    end

  end
end