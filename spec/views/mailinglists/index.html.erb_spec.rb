require 'spec_helper'

describe "mailinglists/index" do
  before(:each) do
    assign(:mailinglists, [
      stub_model(Mailinglist,
        :email => "Email",
        :contractor => false
      ),
      stub_model(Mailinglist,
        :email => "Email",
        :contractor => false
      )
    ])
  end

  it "renders a list of mailinglists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
