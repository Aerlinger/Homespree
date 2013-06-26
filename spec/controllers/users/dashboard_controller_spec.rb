require 'spec_helper'

describe Users::DashboardController do

  before do
    sign_in_contractor FactoryGirl.create :contractor
  end

  describe "GET 'notifications'" do
    it "returns http success" do
      get 'notifications', id: "1"
      response.should be_success
    end
  end

  describe "GET '/users/general_settings'" do
    before { get 'general_settings', id: "1" }

    it "returns http success" do
      response.should be_success
    end

    it "renders template" do
      response.should render_template "users/dashboard/general_settings, layouts/dashboard"
    end
  end

  describe "GET 'inbox'" do
    before { get 'inbox', id: "1" }

    it "returns http success" do
      response.should be_success
    end

    it "renders inbox template" do
      response.should render_template "users/dashboard/inbox"
    end
  end

  describe "GET 'my income'" do
    before { get 'my_income', id: "1" }

    it "returns http success" do
      response.should be_success
    end

    it "renders inbox template" do
      response.should render_template "users/dashboard/my_income"
    end
  end

  describe "GET 'my_projects'" do
    before { get 'my_projects', id: "1" }

    it "returns http success" do
      response.should be_success
    end

    it "renders inbox template" do
      response.should render_template "users/dashboard/my_projects"
    end
  end

  describe "GET 'material_calculator'" do
    before { get 'material_calculator', id: "1" }

    it "returns http success" do
      response.should be_success
    end

    it "renders inbox template" do
      response.should render_template "users/dashboard/material_calculator"
    end
  end

end
