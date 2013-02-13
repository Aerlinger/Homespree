require 'spec_helper'

describe "Mailinglists" do

  before :each do
   # @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("admin", "Meetmike")
  end

  describe "GET /mailinglists" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mailinglists_path
      response.status.should be(200)
    end
  end
end
