require 'spec_helper'


describe Users::ConversationsController do

  it "posts to reply" do
    post("conversation/reply").should route_to("users/conversations#reply")
  end

  it "posts to trash" do
    post("conversation/trash").should route_to("users/conversations#trash")
  end

  it "posts to untrash" do
    post("conversation/untrash").should route_to("users/conversations#untrash")
  end

end