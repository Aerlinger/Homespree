require 'spec_helper'

describe Users::MessagesController, pending: true do
  let(:contractor) { FactoryGirl.create :contractor }
  let(:contractor2) { FactoryGirl.create :contractor }

  it { should respond_to :new }
  it { should respond_to :index }
  it { should respond_to :create }

  before do
    controller.stub(:current_user).and_return(contractor)
    contractor.stub(:confirmed?).and_return(true)
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

      specify { contractor.should_not be_nil }
      specify { contractor.mailbox.should_not be_blank }
      it { expect(assigns(:mailbox)).to be contractor.mailbox }
      it { expect(assigns(:box)).to eq "inbox" }

      its(:response) { should redirect_to "/users/conversations?box=inbox" }
    end

    context "#show" do
      let(:params) do
      end

      before do
        get :show
      end
    end

    context "POST #create" do
      let(:params) do
        {
          _recipients: contractor2.id,
          body: "body",
          subject: "subject"
        }
      end

      before do
        post :create, params
      end

      it { expect(assigns(:box)).to eq "inbox" }

      it "assigns recpients" do
        expect(assigns(:recipients).class).to eq Array
      end

      it "assigns a receipt" do
        expect(assigns(:receipt)).to be_a(Receipt)
      end

      it "assigns a conversation" do
        expect(assigns(:conversation)).to be_a(Conversation)
      end

      its(:response) { should redirect_to "/users/conversations/1?box=sentbox"}
    end

    context "GET #new" do
      let(:params) do
      end

      before do
        get :new, params
      end

      its(:response) { should render_template :new }
    end

    context "GET #show" do
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


  #<h2>Inbox</h2>
  #<table>
  #  <%= content_tag_for(:tr, @mail ) do |conversation| %>
  #    <% message = conversation.messages.first %>
  #    <td><%= image_tag message.sender.photo.url(:small) %></td>
  #  <td><%= link_to message.sender.name, message.sender %></td>
  #    <td><%= message.body %></td>
  #  <% end %>
  #</table>

end