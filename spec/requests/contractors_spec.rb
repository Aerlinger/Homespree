require 'spec_helper'

describe "Contractors" do
  describe "GET /contractors" do
    it "has route to contractors_path" do
      get contractors_path
      response.status.should be(200)
    end
  end
end
