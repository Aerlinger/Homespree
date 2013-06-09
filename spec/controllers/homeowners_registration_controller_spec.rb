require 'spec_helper'


describe Homeowners::RegistrationsController, focus: true do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:homeowner]
  end

  describe "sign up #new" do

    it "should render a new page for the homeowner" do
      get :new
      assigns(:homeowner).should be_a_new(Homeowner)
      response.code.should eq "200"
    end

  end

  describe "creating a new user through #create" do
    it "should render a new page for the homeowner" do
      post :create, {email: "iamahomeowner@rspec.com", password: "iamsecret"}
      response.code.should eq "200"
    end
  end

  describe "destroying a registration" do
    it "should redirect to the sign in page" do
      post :destroy
      page.should redirect_to "/homeowners/sign_in"
    end
  end

end