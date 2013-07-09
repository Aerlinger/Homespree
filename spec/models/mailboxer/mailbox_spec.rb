require "spec_helper"

describe Mailbox do

  subject { Mailbox.new(true) }

  it { should respond_to :type }
  it { should respond_to :messageable }

  it { should respond_to :conversations }
  it { should respond_to :empty_trash}
  it { should respond_to :has_conversation? }
  it { should respond_to :inbox}
  it { should respond_to :sentbox }
  it { should respond_to :trash }
  it { should respond_to :is_completely_trashed? }
  it { should respond_to :is_trashed? }
  it { should respond_to :receipts }
  it { should respond_to :receipts_for }
  it { should respond_to :notifications }
  it { should respond_to :is_trashed? }

end