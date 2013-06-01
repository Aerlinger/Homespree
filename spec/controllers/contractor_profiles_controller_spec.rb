require 'spec_helper'

describe ContractorsController do

  before :each do
    @this_contractor = create :contractor
    @other_contractor = create :contractor
  end

  describe "GET #show" do
    before(:each) { get :show, id: @this_contractor.id }

    context "contractor is viewing their own profile" do
      it "should render controls to edit the page" do
        expect(response).to render_template :show
      end
    end

    it "should assign contractor to @contractor" do
      expect(assigns(:contractor)).to eq @this_contractor
    end

    it "should render contractor page" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    before(:each) { xhr :get, :edit, id: @this_contractor.id }

    it "assigns the requested contractor @contractor" do
      expect(assigns(:contractor)).to eq(@this_contractor)
    end

    it "renders the :edit template" do
      response.content_type.should eq Mime::JS
    end
  end

  describe "PUT #update" do
    before :each do
      @contractor = create(:contractor, email: "updatedcontractor@rspec.com")
    end

    it "locates the requested @contractor" do
      put :update, id: @contractor.id, contractor: attributes_for(:contractor, email: "updatedcontractor@rspec.com")
      expect(assigns(:contractor)).to eq(@contractor)
    end

    context "with valid params" do
      it "save the new contractor in the database" do
        put :update, id: @contractor, contractor: attributes_for(:contractor, first_name: "George")
        @contractor.reload
        expect(@contractor.first_name).to eq("George")
      end

      it "redirects to the updated contractor profile" do
        put :update, id: @contractor, contractor: attributes_for(:contractor, first_name: "George")
        expect(response).to redirect_to "/contractors/#{@contractor.id}"
      end
    end

    context "with invalid params" do
      it "does not change @contractors attributes" do
        put :update, id: @contractor, contractor: attributes_for(:contractor, email: "lol")
        expect(response).to render_template(:edit)
      end

      it "rerenders edit template" do
        put :update, id: @contractor, contractor: attributes_for(:contractor, email: "lol")
      end
    end
  end

  describe "GET #index" do
    it "should only render view for an admin" do
      get :index
      expect(response.status).to eq 401
    end
  end

end