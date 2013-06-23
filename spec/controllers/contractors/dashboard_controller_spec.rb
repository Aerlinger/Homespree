require 'spec_helper'

describe Contractors::DashboardController do

  before do
    sign_in_contractor FactoryGirl.create :contractor
  end

  describe "GET 'notifications'" do
    it "returns http success" do
      get 'notifications', id: "1"
      response.should be_success
    end
  end

  describe "GET 'general'" do
    it "returns http success" do
      get 'general_settings', id: "1"
      response.should be_success
    end
  end

  describe "GET 'inbox'" do
    it "returns http success" do
      get 'inbox', id: "1"
      response.should be_success
    end
  end

  describe "GET 'payments'" do
    it "returns http success" do
      get 'my_income', id: "1"
      response.should be_success
    end
  end

  describe "GET 'my_projects'" do
    it "returns http success" do
      get 'my_projects', id: "1"
      response.should be_success
    end
  end

  describe "GET 'material_calculator'" do
    it "returns http success" do
      get 'material_calculator', id: "1"
      response.should be_success
    end
  end

end
