require 'spec_helper'

describe Contractors::SessionsController do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:contractor]
  end

  describe "Sign in a contractor" do
    it "with helper" do
      c = sign_in create :contractor
      c.should_not be_nil
    end
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
        expect(response).to redirect_to("/contractors/#{c.id}")
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