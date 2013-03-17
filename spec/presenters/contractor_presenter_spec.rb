require 'spec_helper'

describe UserPresenter do

  before do
    @contractor = create(:contractor)
    @presenter = ContractorPresenter.new(@contractor, view)
  end

  it "says when none given" do
    @presenter.website.should include("<span class=\"empty\"></span>")
  end
  it "shows full name" do
    @presenter.full_name.should eq "Joe ThePlumber"
  end

  it "shows email" do
    @presenter.email.should eq "#{@contractor.first_name.downcase}#{@contractor.last_name.downcase}@test.com"
  end

end