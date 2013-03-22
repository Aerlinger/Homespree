require 'spec_helper'

describe UserPresenter do

  before do
    @contractor = create(:contractor)
    @presenter = ContractorPresenter.new(@contractor, view)
  end

  it "says when none given" do
    @presenter.website.should include("<a href=\"joetheplumber.com\" class=\"contractor_website\">joetheplumber.com</a>")
  end

  it "shows profile portrait" do
    @presenter.portrait_picture.should include "<img"
    @presenter.portrait_picture.should include "class"
  end

  it "shows full name" do
    @presenter.full_name.should eq "Joe ThePlumber"
  end

  it "shows email" do
    @presenter.email.should eq "#{@contractor.first_name.downcase}#{@contractor.last_name.downcase}@test.com"
  end

  it "shows title" do
    @presenter.title.should eq "<h1 class=\"contractor_title block-underline-full\">#{@contractor.company_title}</h1>"
  end

end