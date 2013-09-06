require 'spec_helper'

describe Conversation do

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

    it "creates a conversation when two users message one another" do
      expect {
        homeowner.send_message(contractor, "These are my project details", "RE: Details")
      }.to change(Conversation, :count).by(1)
    end

    it "creates two new receipts" do
      expect {
        homeowner.send_message(contractor, "These are my project details", "RE: Details")
      }.to change(Receipt, :count).by(2)
    end

    describe "from contractor to homeowner" do
      before do
        @receipt1     = contractor.send_message(homeowner, "body of the message", "subject of the message")
        @receipt2     = homeowner.reply_to_all(@receipt1, "body of the message", "subject of the message")
        @receipt3     = contractor.reply_to_all(@receipt2, "body of the message", "subject of the message")
        @receipt4     = homeowner.reply_to_all(@receipt3, "body of the message", "subject of the message")
        @message1     = @receipt1.notification
        @message4     = @receipt4.notification
        @conversation = @message1.conversation
      end

      subject { @conversation }

      it { should be_valid }
      its(:recipients) { should match_array [contractor, homeowner]}
      its(:participants) { should match_array [contractor, homeowner]}

      its(:last_sender) { should eq homeowner }
      its(:originator) { should eq contractor }
      its(:original_message) { should eq @message1 }
      its(:last_message) { should eq @message4 }
      its("recipients.count") { should eq 2 }
      its("messages.length") { should eq 4}

      #it "creates association for contractor" do
      #  @conversation.participants.should include User.find(homeowner.id)
      #  @conversation.participants.should include User.find(contractor.id)
      #end

      it "has reference from contractor" do
        contractor.mailbox.conversations.should include @conversation
      end

      it "has reference from homeowner" do
        homeowner.mailbox.conversations.should include @conversation
      end

      describe "and homeowner responds" do
        before do
          homeowner.reply_to_conversation(@conversation, "Reply reply")
        end

        it "has multiple messages" do
          @conversation.messages.length.should eq 5
        end

        it "has proper body in second message" do
          @conversation.messages[1].body.should include("body of the message")
        end

        it "has proper body in second message" do
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

      describe "scopes" do
        let(:participant) { FactoryGirl.create :homeowner }
        let(:inbox_conversation) { contractor.send_message(participant, "body", "subject").notification.conversation }
        let(:sentbox_conversation) { participant.send_message(contractor, "body", "subject").notification.conversation }


        specify ".participant finds conversations with receipts for participant" do
          Conversation.participant(participant).should match_array [inbox_conversation, sentbox_conversation]
        end

        specify ".inbox finds inbox with receipts for participant" do
          Conversation.inbox(participant).should == [inbox_conversation]
        end

        specify ".sentbox finds sentbox with receipts for participant" do
          Conversation.sentbox(participant).should == [sentbox_conversation]
        end

        specify ".trash finds trash conversations with receipts for participant" do
          trashed_conversation = contractor.send_message(participant, "Body", "Subject").notification.conversation
          trashed_conversation.move_to_trash(participant)

          Conversation.trash(participant).should == [trashed_conversation]
        end

        describe ".unread" do
          it "finds unread conversations with receipts for participant" do
            [sentbox_conversation, inbox_conversation].each {|c| c.mark_as_read(participant) }
            unread_conversation = contractor.send_message(participant, "Body", "Subject").notification.conversation

            Conversation.unread(participant).should == [unread_conversation]
          end
        end

        describe "#is_completely_trashed?" do
          it "returns true if all receipts in conversation are trashed for participant" do
            @conversation.move_to_trash(contractor)
            @conversation.is_completely_trashed?(contractor).should be_true
          end
        end

      end
    end
  end
end