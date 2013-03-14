require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contractors'" do
    it "returns http success" do
      get 'contractors'
      response.should be_success
    end
  end

  describe "GET 'homeowners'" do
    it "returns http success" do
      get 'homeowners'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end
