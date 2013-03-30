require 'spec_helper'

describe Contractors::WizardController do

  before do
    @controller = Contractors::WizardController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  specify "Should redirect to contact details by default" do
    get :index
    response.should redirect_to "/contractors/wizard/contact_details"
  end

end
