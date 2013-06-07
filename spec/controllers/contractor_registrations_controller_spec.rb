require 'spec_helper'

describe Contractors::RegistrationsController, "With valid input" do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:contractor]
  end

  describe "GET #new" do
    it "assigns email, company title and password" do
      get :new
      expect(assigns(:contractor)).to be_a_new(Contractor)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contractor in the database" do
        expect {
          post :create, contractor: attributes_for(:contractor)
        }.to change(Contractor, :count).by(1)
      end
      it "redirects to new profile" do
        post :create, contractor: attributes_for(:contractor)
        expect(response).to redirect_to "/contractors/2"
      end
    end

    context "with invalid attributes" do
      it "does not save a new contractor in the database" do
        expect {
          post :create, contractor: attributes_for(:invalid_contractor)
        }.to_not change(Contractor, :count)
      end

      it "re-renders the :new template" do
        post :create, contractor: attributes_for(:invalid_contractor)
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @contractor = create :contractor
    end

    it "redirects to sign in page" do
      delete :destroy, id: @contractor.id
      expect(response).to redirect_to(new_contractor_session_path)
    end
  end

end