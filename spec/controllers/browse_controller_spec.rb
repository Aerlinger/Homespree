require 'spec_helper'

describe BrowseController do

  describe "GET 'contractors'" do
    it "returns http success" do
      get 'contractors'
      response.should be_success
    end
  end

  describe "GET 'inspire'" do
    it "returns http success" do
      get 'inspire'
      response.should be_success
    end
  end

end
