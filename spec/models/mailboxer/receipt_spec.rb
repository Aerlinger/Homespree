require 'spec_helper'

describe Receipt do

  let(:receipt) { FactoryGirl.create(:receipt) }

  # Associations
  it { should respond_to :notification }  # Belongs to a notification
  it { should respond_to :receiver }      # Belongs to a receiver
  it { should respond_to :message }       # Belongs to a message

  # Table attributes:
  it { should respond_to :created_at }
  it { should respond_to :updated_at }
  it { should respond_to :receiver_id }
  it { should respond_to :receiver_type }
  it { should respond_to :notification_id }
  it { should respond_to :trashed }
  it { should respond_to :deleted }
  it { should respond_to :mailbox_type }

  # Instance methods
  it { should respond_to :is_read }
  it { should respond_to :mark_as_read }
  it { should respond_to :mark_as_unread }
  it { should respond_to :move_to_trash }
  it { should respond_to :untrash }
  it { should respond_to :move_to_inbox }
  it { should respond_to :move_to_sentbox }
  it { should respond_to :conversation }
  it { should respond_to :is_unread? }
  it { should respond_to :is_trashed? }

  # Scopes
  specify { Receipt.should respond_to :recipient }
  specify { Receipt.should respond_to :notifications_receipts }
  specify { Receipt.should respond_to :messages_receipts }
  specify { Receipt.should respond_to :notification }
  specify { Receipt.should respond_to :conversation }
  specify { Receipt.should respond_to :sentbox }
  specify { Receipt.should respond_to :inbox }
  specify { Receipt.should respond_to :trash }
  specify { Receipt.should respond_to :not_trash }
  specify { Receipt.should respond_to :is_read }
  specify { Receipt.should respond_to :is_unread }

  # Class methods
  specify { Receipt.should respond_to :mark_as_read }
  specify { Receipt.should respond_to :mark_as_unread }
  specify { Receipt.should respond_to :move_to_trash }
  specify { Receipt.should respond_to :untrash }
  specify { Receipt.should respond_to :move_to_inbox }
  specify { Receipt.should respond_to :move_to_sentbox }
  specify { Receipt.should respond_to :update_receipts }


  it "is valid with homeowner as the receiver" do
    receipt.receiver = FactoryGirl.create :contractor
    receipt.should be_valid
  end


end
