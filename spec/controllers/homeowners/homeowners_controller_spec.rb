require 'spec_helper'

describe HomeownersController do

  def valid_session
    {}
  end

  let(:valid_homeowner_attributes) { FactoryGirl.attributes_for :homeowner }
  let(:homeowner) { FactoryGirl.create :homeowner }

  describe "GET show" do
    before(:each) { get :show, id: homeowner.id }

    it "assigns the requested homeowner as @homeowner" do
      get :show, :id => homeowner.id
      assigns(:homeowner).should eq(homeowner)
    end

    context "homeowner is viewing their own profile" do
      it "should render controls to edit the page" do
        expect(response).to render_template :show
      end
    end

    it "should assign homeowner to @homeowner" do
      expect(assigns(:homeowner)).to eq homeowner
    end

    it "should render homeowner page" do
      expect(response).to render_template(:show)
    end
  end

end
