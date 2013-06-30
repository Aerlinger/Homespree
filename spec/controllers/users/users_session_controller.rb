require "spec_helper"

describe Users::SessionController do

  let!(:contractor) { FactoryGirl.create :contractor }
  let(:homeowner) { FactoryGirl.create :homeowner }

  before do
    sign_in contractor
  end

  # A simple trick to help devise cooperate with our test controller
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:contractor]
    sign_in contractor
  end

  describe "GET #new" do
    context "with valid params"
  end

  describe "POST #create (login) action" do

    context "with valid params" do
      before :each do
        post :create, contractor: {email: contractor.email, password: "iamsecret"}
      end

      it "redirects to the contractor's homepage" do
        expect(response).to redirect_to("/contractors/#{contractor.slug}")
      end

      it "displays flash message" do
        flash[:notice].should_not be_nil
      end

      describe "then logout with DELETE #destroy" do

        it "Should redirect to root path" do
          delete :destroy, id: contractor.id
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context "with invalid params" do
      before do
        sign_out contractor
        post :create, contractor: {email: contractor.email, password: "invalidpass"}
      end

      it "redirects to the contractor's homepage" do
        expect(response).to render_template "sign_in"
      end

      it "displays error message" do
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