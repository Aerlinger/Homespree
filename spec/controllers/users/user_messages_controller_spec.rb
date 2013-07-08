require 'spec_helper'

describe Users::MessagesController do

  let(:contractor) { FactoryGirl.create :contractor }
  let(:contractor2) { FactoryGirl.create :contractor }

  it { should respond_to :new }
  it { should respond_to :index }
  it { should respond_to :create }

  before do
    controller.stub!(:current_user).and_return(contractor)
    contractor.stub!(:confirmed?).and_return(true)
  end

  context "#index" do
    describe "when signed in" do
      before do
        sign_in contractor
        get :index
      end

      #it { assigns(:mailbox).to be contractor.mailbox }
      its(:response) { should redirect_to "/users/conversations?box=inbox" }
    end

    describe "when not signed in" do
      before do
        get :index
      end

      its(:response) { should redirect_to "/users/sign_in" }
    end
  end

  context "#edit" do
    before do
      #get :edit
    end

    #it { should render_template :edit }
  end

  context "#new" do
  end

  context "#create" do
  end

end