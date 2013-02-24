require 'spec_helper'

describe "contractors/edit" do
  before(:each) do
    @contractor = assign(:contractor, stub_model(Contractor,
      :name => "MyString",
      :number => "MyString",
      :description => "MyText",
      :specialties => "MyText",
      :website => "MyString",
      :facebook => "MyString",
      :twitter => "MyString"
    ))
  end

  it "renders the edit contractor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contractors_path(@contractor), :method => "post" do
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
