require "spec_helper"

describe Users::SessionsController do

  # Auth helpers
  it { should respond_to :current_user }
  it { should respond_to :guest_homeowner }

  let!(:contractor) { FactoryGirl.create :contractor }
  let!(:contractor_params) { { user: { email: contractor.email, password: contractor.password}} }
  let!(:contractor_invalid_params) { { user: FactoryGirl.attributes_for(:contractor, email: "nonsense") } }

  let(:homeowner) { FactoryGirl.create :homeowner }
  let!(:homeowner_params) { FactoryGirl.attributes_for :homeowner }
  let!(:homeowner_invalid_params) { FactoryGirl.attributes_for :contractor, email: "nonsense" }

  before {       @request.env["devise.mapping"] = Devise.mappings[:contractor] }

  context "Contractor" do
    before :each do
      sign_in contractor
    end

    describe "creates a Warden session" do
      it { should respond_to :session }
      specify { contractor.should eq subject.current_user }
      specify { session["warden.user.contractor.key"][0].should eq [contractor.id] }
      specify { session["warden.user.contractor.key"][1].should_not be_blank }
    end

    describe "GET #new" do
      before { get :new }

      it "redirects to contractor profile" do
        expect(response).to redirect_to contractor_path(contractor)
      end
    end

    describe "DELETE #destroy when not logged in" do
      it "Should show flash notice" do
        delete :destroy
        response.should_not be_nil
      end
    end
  end

  describe "POST #create (login) action" do
    context "with valid params" do
      before :each do
        post :create, contractor_params
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

      it "redirects to the contractor's homepage" do
        expect(response).to render_template :new
      end
    end
  end
end