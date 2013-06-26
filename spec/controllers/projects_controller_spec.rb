require 'spec_helper'

describe ProjectsController do

  let(:project) { FactoryGirl.create }
  it { should respond_to :create }

  describe "Creates a new project from homepage" do
    let(:params) do
      { zipcode: "10025", category_name: "Power Washing" }
    end

    it "has correct params" do
      params.should eq({ zipcode: "10025", category_name: "Power Washing" })
    end

    describe "when a homeowner is not signed in" do
      before do
        post :create, params
      end

      it "creates a new guest homeowner" do
        expect {
          post(:create, params)
        }.to change(Homeowner, :count).by(1)
      end

      it "is a redirect" do
        response.should be_redirect
      end

      it "assigns project" do
        project = build :project
        post :create, FactoryGirl.attributes_for(:project)
        expect(assigns(:project)).to eq project
      end

      it "redirects to homeowner" do
        response.should redirect_to "/project_wizard/request?project_id=1"
      end


      describe "creates a guest homeowner" do
        it "has correct class type" do
          subject.current_user.class.should be Homeowner
        end

      end

    end


    describe "when a homeowner is signed in" do
      let(:homeowner) { FactoryGirl.create :homeowner }

      xit "homeowner login is not yet implemented"

    end

    describe "when a contractor is signed in" do

    end
  end

end
