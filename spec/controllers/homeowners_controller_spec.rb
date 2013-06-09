require 'spec_helper'

describe HomeownersController, focus: true do

  def valid_session
    {}
  end

  let(:valid_homeowner_attributes) { FactoryGirl.attributes_for :homeowner }
  let(:homeowner) { FactoryGirl.create :homeowner }

  describe "GET show" do
    it "assigns the requested homeowner as @homeowner" do
      get :show, {:id => homeowner.id}, valid_session
      assigns(:homeowner).should eq(homeowner)
    end
  end



end
