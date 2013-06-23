require 'spec_helper'


describe Contractors::ConversationsController do

  xit "posts to reply" do
    post("/users/conversations/1/reply").should route_to("users/conversations#reply", id: "1")
  end

  xit "posts to trash" do
    post("/users/conversations/1/trash").should route_to("users/conversations#trash", id: "1")
  end

  xit "posts to untrash" do
    post("/users/conversations/1/untrash").should route_to("users/conversations#untrash", id: "1")
  end

  xit "gets a conversation" do

  end

end