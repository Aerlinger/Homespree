require 'spec_helper'

describe Contractors::RegistrationsController, "With valid input" do

  let(:contractor) { FactoryGirl.create :contractor }
  let(:valid_params) { FactoryGirl.attributes_for :contractor }
  let(:invalid_params) { FactoryGirl.attributes_for :contractor, email: "nonsense" }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:contractor]
  end

  describe "GET #new" do
    before do
      get :new
    end

    it "assigns email, company title and password" do
      expect(assigns(:contractor)).to be_a_new(Contractor)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    before do
      valid_params
      contractor
    end

    context "with valid attributes" do
      it "saves the new contractor in the database" do
        expect {
          post :create, contractor: valid_params
        }.to change(Contractor, :count).by(1)
      end

      it "redirects to new profile" do
        post :create, valid_params
        #expect(response).to redirect_to "/contractors/joe-s-plumbing"
        expect(response).to be_success
        expect(response).to render_template :new
      end
    end

    context "with invalid attributes" do
      it "does not save a new contractor in the database" do
        expect {
          post :create, invalid_params
        }.to change(Contractor, :count).by(0)
      end

      it "re-renders the :new template" do
        post :create, contractor: invalid_params
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
  end

  describe "DELETE #destroy" do
    before :each do
      contractor
      valid_params
    end

    it "removes the contractor from the DB" do
      sign_in contractor
      contractor
      expect {
        delete :destroy
      }.to change(Contractor, :count).by(-1)
    end

    it "redirects to sign in page" do
      sign_in contractor
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end

end