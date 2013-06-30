require 'spec_helper'

describe Users::ConversationsController do

  let(:homeowner) { FactoryGirl.create :homeowner }
  let(:conractor) { FactoryGirl.create :contractor }

  it { should respond_to :create }
  it { should respond_to :reply }
  it { should respond_to :trash }
  it { should respond_to :untrash }

  let(:params) do
    { subject: "New Job Request", recipients: "jane stevens, bill smith, steve smallberg", body: "Hey guys, what's up?\n Any updates on the latest project?" }
  end



end
