require 'spec_helper'

describe "contractors/new" do
  before(:each) do
    assign(:contractor, stub_model(Contractor,
      :name => "MyString",
      :number => "MyString",
      :description => "MyText",
      :specialties => "MyText",
      :website => "MyString",
      :facebook => "MyString",
      :twitter => "MyString"
    ).as_new_record)
  end

  it "renders new contractor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contractors_path, :method => "post" do
      assert_select "input#contractor_name", :name => "contractor[name]"
      assert_select "input#contractor_number", :name => "contractor[number]"
      assert_select "textarea#contractor_description", :name => "contractor[description]"
      assert_select "textarea#contractor_specialties", :name => "contractor[specialties]"
      assert_select "input#contractor_website", :name => "contractor[website]"
      assert_select "input#contractor_facebook", :name => "contractor[facebook]"
      assert_select "input#contractor_twitter", :name => "contractor[twitter]"
    end
  end
end
