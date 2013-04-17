describe Contractor::ProfilesController, focus: true do

  describe "GET #new" do
    it "assigns a new contractor to @contractor"
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contractor in the database"
      it "redirects to new profile" do
        post :create, contractor: attributes_for(:contractor)
        expect(response).to redirect_to contractor_profile_path
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

  describe "GET #show" do
    context "contractor is viewing their own profile" do
      it "should render controls to edit the page"
    end

    it "should assign contractor to @contractor"
    it "should render contractor page"
  end

  describe "GET #edit" do
    it "assigns the requested contractor @contractor"
    it "renders the :edit template"
  end

  describe "PUT #update" do
    before :each do
      @contractor = create(:contractor, email: "updatedcontractor@rspec.com")
    end

    it "locates the requested @contractor" do
      put :update, id: @contractor, contractor: attributes_for(:contractor)
      expect(assigns(:contractor)).to eq(@contractor)
    end

    context "with valid params" do
      it "save the new contractor in the database"

      it "redirects to the updated contractor profile"
    end

    context "with invalid params" do
      it "does not change @contractors attributes"
      it "rerenders edit template"
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @message = create :@message
    end

    it "deletes the message" do
      expect {
        delete :destroy, id: @contractor
      }.to change(Contractor, :count).by(-1)
    end

    it "redirects to messages#index" do
      delete :destroy, id @contractor
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #index" do
    it "should only render view for an admin"
  end

end