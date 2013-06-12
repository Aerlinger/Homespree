require 'spec_helper'

describe Message do

  let(:message) { FactoryGirl.create(:message) }

  it "is valid" do
    message.should be_valid
  end

end
