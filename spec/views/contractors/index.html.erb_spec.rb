require 'spec_helper'

describe "contractors/index" do
  before(:each) do
    assign(:contractors, [
      stub_model(Contractor,
        :name => "Name",
        :number => "Number",
        :description => "MyText",
        :specialties => "MyText",
        :website => "Website",
        :facebook => "Facebook",
        :twitter => "Twitter"
      ),
      stub_model(Contractor,
        :name => "Name",
        :number => "Number",
        :description => "MyText",
        :specialties => "MyText",
        :website => "Website",
        :facebook => "Facebook",
        :twitter => "Twitter"
      )
    ])
  end

  it "renders a list of contractors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
  end
end
