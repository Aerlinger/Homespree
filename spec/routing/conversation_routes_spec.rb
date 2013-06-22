require 'spec_helper'


describe Users::ConversationsController do

  it "posts to reply" do
    post("/conversations/1/reply").should route_to("users/conversations#reply", id: "1")
  end

  it "posts to trash" do
    post("/conversations/1/trash").should route_to("users/conversations#trash", id: "1")
  end

  it "posts to untrash" do
    post("/conversations/1/untrash").should route_to("users/conversations#untrash", id: "1")
  end

  it "gets a conversation" do

  end

end