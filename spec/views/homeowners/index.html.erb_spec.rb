require 'spec_helper'

describe "homeowners/index" do
  before(:each) do
    assign(:homeowners, [
      stub_model(Homeowner,
        :name => "Name",
        :email => "Email"
      ),
      stub_model(Homeowner,
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of homeowners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
