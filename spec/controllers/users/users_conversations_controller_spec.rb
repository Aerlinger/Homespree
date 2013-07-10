require "spec_helper"

describe Users::ConversationsController do

  let(:contractor) { FactoryGirl.create :contractor }
  let(:contractor2) { FactoryGirl.create :contractor }

  it { should respond_to :index }
  it { should respond_to :show }
  it { should respond_to :update }
  it { should respond_to :destroy }

  before do
    controller.stub!(:current_user).and_return(contractor)
    contractor.stub!(:confirmed?).and_return(true)
  end

  describe "when signed in" do

    let(:params) do
      { id: contractor.id, box: "inbox" }
    end

    before do
      sign_in contractor
    end

    context "GET #index" do
      before do
        get :index
      end

      it { expect(assigns(:mailbox)).to be contractor.mailbox }
      it { expect(assigns(:conversations)) }
      it { expect(assigns(:box)).to eq "inbox" }

      its(:response) { should render_template :index }

      it "renders show when XHR" do
        request.stub(:xhr?).and_return(true)
        response.should render_template :index
      end
    end

    context "PUT #update" do
      let(:params) do
        {
          id:        contractor.id,
          untrash:   true,
          reply_all: true
        }
      end

      before do
        put :update, params
      end

      it { expect(assigns(:receipt)).to eq nil }
      it { expect(assigns(:receipts)).to eq nil }

      it { expect(assigns(:box)).to eq "inbox" }
      it { should redirect_to action: :show, box: "inbox" }

      describe "contractor sends another contractor a message" do

        before do
          @receipt = contractor.send_message(contractor2, "why hello", "subject")
        end

        let(:params) do
          {
            id:        contractor.id,
            untrash:   true,
            reply_all: true
          }
        end

        before do
          put :update, params
        end

        specify { @receipt.should_not be_nil }

        it { contractor.mailbox.sentbox.size.should eq 1 }
        it { contractor2.mailbox.inbox.size.should eq 1 }

        it { expect(assigns(:receipt)).to eq nil }
        it { expect(assigns(:receipts)).to eq nil }

        it { expect(assigns(:box)).to eq "inbox" }
        it { should redirect_to action: :show, box: "inbox" }

      end
    end

    context "#show" do
      let(:params) do

      end

      before do
        get :show
      end
    end

    context "GET #show" do
      #let(:message) { FactoryGirl.create :message }

      before do

      end
    end

    context "DELETE #destroy" do
      #let(:message) { FactoryGirl.create :message }

      before do

      end
    end
  end

  describe "when not signed in" do
    before do
      get :index
    end

    it { expect(assigns(:box)).to eq nil }
    its(:response) { should redirect_to "/users/sign_in" }
  end


  context "#new" do
  end

  context "#create" do
  end

end