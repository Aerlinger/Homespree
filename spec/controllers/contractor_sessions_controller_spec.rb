require "spec_helper"

describe Contractor::SessionsController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:contractor]
  end


end