require 'spec_helper'

describe ConversationsController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'reply'" do
    it "returns http success" do
      get 'reply'
      response.should be_success
    end
  end

  describe "GET 'trash'" do
    it "returns http success" do
      get 'trash'
      response.should be_success
    end
  end

  describe "GET 'untrash'" do
    it "returns http success" do
      get 'untrash'
      response.should be_success
    end
  end

end
