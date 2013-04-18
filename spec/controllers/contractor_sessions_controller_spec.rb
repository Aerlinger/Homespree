require "spec_helper"

describe Contractors::SessionsController do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:contractor]
  end

end