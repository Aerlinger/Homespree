require 'spec_helper'

describe "homeowners/edit" do
  before(:each) do
    @homeowner = assign(:homeowner, stub_model(Homeowner,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit homeowner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", homeowner_path(@homeowner), "post" do
      assert_select "input#homeowner_name[name=?]", "homeowner[name]"
      assert_select "input#homeowner_email[name=?]", "homeowner[email]"
    end
  end
end
