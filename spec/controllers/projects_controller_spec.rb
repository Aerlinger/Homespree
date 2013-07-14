require 'spec_helper'

describe ProjectsController do
  let(:project) { FactoryGirl.create :project }
  let(:project_type) { FactoryGirl.create :project_type }
  let(:params) { {project: { zipcode: "10025", project_type_id: project_type.id} }  }

  before do
    request.env["HTTP_REFERER"] = "/"
  end

  it { should respond_to :create }

  it "creates a new project" do
    expect {
      post(:create, params)
    }.to change(Project, :count).by(1)
  end

  describe "Creates a new project from homepage" do
    describe "when a homeowner is not signed in" do
      before do
        post :create, params
      end

      it "is a redirect" do
        response.should be_redirect
      end

      it "assigns project" do
        expect(assigns(:project).class).to eq project.class
      end

      it "redirects to homeowner" do
        proj = assigns(:project)
        response.should redirect_to "/project_wizard/request"
      end

      describe "creates a guest homeowner" do
        it "creates a new guest homeowner" do
          params
          expect {
            post(:create, params)
          }.to change(Homeowner, :count).by(1)
        end

        its(:guest_homeowner) { should eq subject.current_user }
        its(:current_user) { should be_guest }
      end
    end

    describe "when a homeowner is signed in" do
      let(:homeowner) { FactoryGirl.create :homeowner }

      before { sign_in homeowner }

      its(:current_user) { should eq homeowner }
      its(:current_user) { should be_homeowner }
    end

    describe "when a contractor is signed in" do
    end
  end
end
