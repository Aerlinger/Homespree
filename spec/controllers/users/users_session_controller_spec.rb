require "spec_helper"

describe Users::SessionsController do
  let!(:contractor) { FactoryGirl.create :contractor }
  let!(:contractor_params) { { user: { email: contractor.email, password: contractor.password}} }
  let!(:contractor_invalid_params) { { user: FactoryGirl.attributes_for(:contractor, email: "nonsense") } }

  let(:homeowner) { FactoryGirl.create :homeowner }
  let!(:homeowner_params) { FactoryGirl.attributes_for :homeowner }
  let!(:homeowner_invalid_params) { FactoryGirl.attributes_for :contractor, email: "nonsense" }

  context "Contractor" do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:contractor]
      sign_in contractor
    end

    describe "GET #new" do
      before do
        get :new
      end

      it "assigns email, company title and password" do
        expect(assigns(:user)).to be_a_new(User)
      end

      it "renders the :new template" do
        expect(response).to render_template :new
      end
    end

    describe "POST #create (login) action" do
      context "with valid params" do
        before :each do
          post :create, contractor_params
        end

        it "redirects to the contractor's homepage" do
          expect(response).to redirect_to("/contractors/#{contractor.slug}")
        end

        it "finds contractor" do
          expect(assigns(:user).id).to eq contractor.id
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
          post :create, contractor_invalid_params
        end

        it "displays flash message" do
          flash[:notice].should eq "Could not sign in, please check your details"
        end

        it "redirects to the contractor's homepage" do
          expect(response).to render_template :new
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
end