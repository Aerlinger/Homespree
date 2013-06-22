require 'spec_helper'

describe HomeownersController do

  let(:homeowner) { FactoryGirl.create(:homeowner) }

  describe "GET #show" do
    before(:each) { get :show, id: homeowner.id }

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