require 'spec_helper'

describe "Searching" do
  let(:contractor) { FactoryGirl.create :contractor, zipcode: '10027' }
  let(:homeowner) { FactoryGirl.create :homeowner, zipcode: '10027' }
  let(:homeowner_address) { homeowner.address }

  describe "homeowner searches for contractors in her area" do
    let!(:nearby_contractors) { homeowner.nearby_contractors() }

    specify { nearby_contractors.should eq [] }
  end
end

#Contractor.all(:select => "transactions.amount", :conditions => "creditcards.status = 'active'", :joins => :transaction)+Bankaccount.sum(:all, :select => "transactions.amount", :conditions => "bankaccounts.status = 'active'", :joins => :transaction)