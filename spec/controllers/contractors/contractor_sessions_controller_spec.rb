require 'spec_helper'

describe Contractors::SessionsController do

  # A simple trick to help devise cooperate with our test controller
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:contractor]

    contractor = FactoryGirl.create :contractor
    #@contractor.confirm!
    sign_in contractor
  end

  it "assigns current_contractor" do
    current_contractor.should eq @contractor
  end

  it "current_user should equal current_contractor" do
    current_user.should eq @contractor
  end

  it "shows contractor as signed in" do
    contractor_signed_in?.should be true
  end

  it "is logged in" do
    logged_in?.should be true
  end

  describe "GET #new" do
    context "with valid params"
  end

  describe "POST #create (login) action" do

    let!(:c) { create :contractor }

    context "with valid params" do
      before :each do
        post :create, contractor: {email: c.email, password: "iamsecret"}
      end

      it "redirects to the contractor's homepage" do
        expect(response).to redirect_to("/contractors/#{c.slug}")
      end

      it "displays flash message" do
        flash[:notice].should_not be_nil
      end

      describe "then logout with DELETE #destroy" do
        it "Should show flash notice" do
          delete :destroy, id: c.id
          flash[:notice].should_not be_nil
        end

        it "Should redirect to root path" do
          delete :destroy, id: c.id
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context "with invalid params" do
      it "redirects to the contractor's homepage" do
        post :create, contractor: {email: c.email, password: "invalidpass"}
        expect(response).to render_template("contractors/sessions/new")
      end

      it "displays error message" do
        post :create, contractor: {email: c.email, password: "invalidpass"}
        flash[:alert].should_not be_nil
      end
    end

  end

  describe "DELETE #destroy when not logged in" do
    it "Should show flash notice" do
      delete :destroy
      response.should_not be_nil
    end
  end

end