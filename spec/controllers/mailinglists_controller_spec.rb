describe MailinglistsController do
  describe "POST #create" do
    context "with valid attributes" do

      it "creates a new entry for a mailing list" do
        expect {
          xhr :post, :create, mailinglist: attributes_for(:mailinglist)
        }.to change(Mailinglist, :count).by(1)
      end

      it "rerenders mailinglist.js page" do
        xhr :post, :create, mailinglist: attributes_for(:mailinglist)
        response.content_type.should eq Mime::JS
      end
    end

    context "with invalid attributes" do
      it "does not save the mailing list entry" do
        expect {
          xhr :post, :create, mailinglist: attributes_for(:invalid_mailinglist)
        }.to raise_exception(ActiveRecord::RecordInvalid)
      end

      it "rerenders mailinglist.js page" do
        expect {
          xhr :post, :create, mailinglist: attributes_for(:invalid_mailinglist)
        }.to raise_exception(ActiveRecord::RecordInvalid)
      end

    end
  end
end