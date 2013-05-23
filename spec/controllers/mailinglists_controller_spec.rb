describe MailinglistsController do
  describe "POST #create" do
    context "with valid homewoner attributes" do

      it "creates a new entry for a mailing list" do
        expect {
          xhr :post, :create, mailinglist: attributes_for(:mailinglist, user_type: "homeowner")
        }.to change(Mailinglist, :count).by(1)
      end

      it "rerenders mailinglist.js page" do
        xhr :post, :create, mailinglist: attributes_for(:mailinglist, user_type: "homeowner")
        response.content_type.should eq Mime::JS
      end
    end

    context "with invalid attributes" do
      it "does not save the mailing list entry" do
        expect {
          xhr :post, :create, mailinglist: attributes_for(:invalid_mailinglist, user_type: "homeowner")
        }.to raise_exception(ActiveRecord::RecordInvalid)
      end

      it "rerenders mailinglist.js page" do
        expect {
          xhr :post, :create, mailinglist: attributes_for(:invalid_mailinglist, user_type: "homeowner")
        }.to raise_exception(ActiveRecord::RecordInvalid)
      end

    end
  end
end