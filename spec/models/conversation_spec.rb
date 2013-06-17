require 'spec_helper'

describe Conversation do

  let(:conversation) { FactoryGirl.create(:conversation) }

  # Associations
  it { should respond_to :messages }  # has_many messages
  it { should respond_to :receipts }  # has_many receipts through messages

  # Instance Methods:
  it { should respond_to :mark_as_read }
  it { should respond_to :mark_as_unread }
  it { should respond_to :move_to_trash }
  it { should respond_to :untrash }
  it { should respond_to :recipients }
  it { should respond_to :participants }
  it { should respond_to :originator }
  it { should respond_to :original_message }
  it { should respond_to :last_sender }
  it { should respond_to :last_message }
  it { should respond_to :receipts_for }
  it { should respond_to :count_messages }
  it { should respond_to :is_participant? }
  it { should respond_to :is_trashed? }
  it { should respond_to :is_completely_trashed? }
  it { should respond_to :is_read? }
  it { should respond_to :is_unread? }

  # Scopes:
  specify { Conversation.should respond_to :participant }
  specify { Conversation.should respond_to :inbox }
  specify { Conversation.should respond_to :sentbox }
  specify { Conversation.should respond_to :trash }
  specify { Conversation.should respond_to :unread }
  specify { Conversation.should respond_to :not_trash }

  # Validations
  it "is invalid without a subject" do
    expect(Conversation.new(subject: nil)).to have(1).errors_on(:subject)
  end


end