require 'spec_helper'

describe Homeowners::RegistrationsController do

  let(:homeowner) { FactoryGirl.create :homeowner }
  let(:valid_params) { FactoryGirl.attributes_for :homeowner }
  let(:invalid_params) { FactoryGirl.attributes_for :homeowner, email: "nonsense" }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:homeowner]
  end

  describe "GET #new" do
    before do
      get :new
    end

    it "assigns email, company title and password" do
      expect(assigns(:homeowner)).to be_a_new(Homeowner)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new homeowner in the database" do
        expect {
          post :create, homeowner: valid_params
        }.to change(Homeowner, :count).by(1)
      end
      it "redirects to new profile" do
        post :create, homeowner: valid_params
        expect(response).to redirect_to "/homeowners/#{homeowner.id - 1}"
      end
    end

    context "with invalid attributes" do
      it "does not save a new homeowner in the database" do
        expect {
          post :create, homeowner: invalid_params
        }.to change(Homeowner, :count).by(0)
      end

      it "re-renders the :new template" do
        post :create, homeowner: invalid_params
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
  end

  describe "DELETE #destroy" do
    before :each do
      @homeowner = create :homeowner
    end

    xit "removes the homeowner from the DB" do
      expect {
        delete :destroy, id: @homeowner.id
      }.to change(Homeowner, :count).by(-1)
    end

    it "redirects to sign in page" do
      delete :destroy, id: @homeowner.id
      expect(response).to redirect_to(root_path)
    end
  end

end