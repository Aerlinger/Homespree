require 'spec_helper'

describe "homeowners/show" do
  before(:each) do
    @homeowner = assign(:homeowner, stub_model(Homeowner,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
  end
end
