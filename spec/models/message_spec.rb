# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  author_id  :integer
#  thread_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Message do

  let(:message) { FactoryGirl.create(:message) }

  it { should respond_to :content }
  it { should respond_to :author_id }

  it "is valid" do
    message.should be_valid
  end



end
