describe MailinglistsController do

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new entry for a mailing list" do
        expect {
          post :create, mailinglist: attributes_for(:mailinglist)
        }.to change(Mailinglist, :count).by(1)
      end

      it "rerenders mailinglist.js page" do
        post :create, mailinglist: attributes_for(:mailinglist)
        expect(response).to render_template :create
      end
    end

    context "with invalid attributes" do
      it "does not save the mailing list entry" do
        expect {
          post :create, mailinglist: attributes_for(:invalid_mailinglist)
        }.to_not change(Mailinglist, :count)
      end

      it "rerenders mailinglist.js page" do
        post :create, mailinglist: attributes_for(:invalid_mailinglist)
        expect(response).to render_template :create
      end
    end
  end

end