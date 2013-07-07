require 'spec_helper'

describe Conversation do

  let(:conversation) { FactoryGirl.create(:conversation) }

  # Associations
  it { should have_many :messages } # has_many messages
  it { should have_many :receipts } # has_many receipts through messages

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

  describe "creating a conversation" do
    let(:homeowner) { FactoryGirl.create(:homeowner) }
    let(:contractor) { FactoryGirl.create(:contractor) }

    describe "from contractor to homeowner" do
      before do
        @receipt      = contractor.send_message(homeowner, "body of the message", "subject of the message")
        @conversation = @receipt.conversation
      end

      it "is valid" do
        @conversation.should be_valid
      end

      it "creates association for homeowner" do
        @conversation.recipients.should include User.find(homeowner.id)
      end

      it "creates association for contractor" do
        @conversation.participants.should include User.find(homeowner.id)
        @conversation.participants.should include User.find(contractor.id)
      end

      it "has reference from contractor" do
        contractor.mailbox.conversations.should include @conversation
      end

      it "has reference from homeowner" do
        homeowner.mailbox.conversations.should include @conversation
      end

      it "has one message" do
        @conversation.messages.length.should eq 1
      end

      describe "and homeowner responds" do
        before do
          homeowner.reply_to_conversation(@conversation, "Reply reply")
        end

        it "should have multiple messages" do
          @conversation.messages.length.should eq 2
        end

        it "should have proper body in second message" do
          @conversation.messages[1].body.should include("Reply")
        end

        it "should have proper body in second message" do
          @conversation.messages[0].body.should include("body of the message")
        end
      end

      describe "contractor association" do
        specify "has conversation" do
          contractor.mailbox.conversations.should include(@conversation)
        end

        specify "has conversation" do
          contractor.mailbox.conversations.should include(@conversation)
        end

        specify "has conversation" do
          homeowner.mailbox.conversations.count == 1
        end
      end

    end

    describe "from homeowner to contractor" do

    end

  end

end