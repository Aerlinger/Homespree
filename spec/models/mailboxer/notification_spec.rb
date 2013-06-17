require "spec_helper"

describe Notification do

  let(:notification) { FactoryGirl.create(:notification) }

  subject { notification }

  # Notification table attributes:
  it { should respond_to :type }
  it { should respond_to :body }
  it { should respond_to :subject }
  it { should respond_to :sender_id }
  it { should respond_to :sender_type }
  it { should respond_to :conversation_id }
  it { should respond_to :draft }
  it { should respond_to :notified_object_id }
  it { should respond_to :notified_object_type }
  it { should respond_to :notification_code }
  it { should respond_to :attachment }

  # Notification instance methods
  it { should respond_to :expired? }
  it { should respond_to :expire! }
  it { should respond_to :expire }
  it { should respond_to :deliver }
  it { should respond_to :recipients }
  it { should respond_to :receipt_for }
  it { should respond_to :receipts_for }
  it { should respond_to :is_unread? }
  it { should respond_to :is_read? }
  it { should respond_to :is_trashed? }
  it { should respond_to :mark_as_read }
  it { should respond_to :mark_as_unread }
  it { should respond_to :move_to_trash }
  it { should respond_to :clean }
  it { should respond_to :object }

  # Associations
  it { should respond_to :receipts } # Has many receipts
  it { should respond_to :notified_object } # belongs to a notified object (polymorphic)
  it { should respond_to :sender } # belongs to a sender (polymorphic)

  # Notification class methods
  specify { Notification.should respond_to :notify_all }
  specify { Notification.should respond_to :successful_delivery? }

  # Notification scopes:
  specify { Notification.should respond_to :unread }
  specify { Notification.should respond_to :global }
  specify { Notification.should respond_to :expired }
  specify { Notification.should respond_to :unexpired }
  specify { Notification.should respond_to :not_trashed }


  it { should be_valid }

  it "is not valid without a subject" do
    notification.subject = nil
    expect(notification).to have(1).errors_on(:subject)
  end

  it "is not valid without a body" do
    notification.body = nil
    expect(notification).to have(1).errors_on(:body)
  end


  describe "sending messages" do
    let(:homeowner) { FactoryGirl.create(:homeowner) }
    let(:contractor) { FactoryGirl.create(:contractor) }

    describe "from contractor to homeowner" do
      before do
        notification.recipients << homeowner
        notification.sender = contractor
      end

      it "belongs to the contractor" do
        contractor.notifications.should include(notification)
      end

      it "belongs to the homeowner" do

      end
    end

    describe "sending from homeowner to contractor" do

    end
  end

end