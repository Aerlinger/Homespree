require 'spec_helper'

describe "mailinglists/show" do
  before(:each) do
    @mailinglist = assign(:mailinglist, stub_model(Mailinglist,
      :email => "Email",
      :contractor => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/false/)
  end
end
