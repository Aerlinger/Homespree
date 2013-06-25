require 'spec_helper'

describe Users::ConversationsController do

  it { should respond_to :create }
  it { should respond_to :reply }
  it { should respond_to :trash }
  it { should respond_to :untrash }
  it { should respond_to :mailbox }

  let(:params) do
    {}
  end

end
