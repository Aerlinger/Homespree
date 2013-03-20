require 'spec_helper'

describe "homeowners/new" do
  before(:each) do
    assign(:homeowner, stub_model(Homeowner,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new homeowner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", homeowners_path, "post" do
      assert_select "input#homeowner_name[name=?]", "homeowner[name]"
      assert_select "input#homeowner_email[name=?]", "homeowner[email]"
    end
  end
end
