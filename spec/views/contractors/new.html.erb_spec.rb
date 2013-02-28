require 'spec_helper'

describe "contractors/new" do
  before(:each) do
    #assign(:contractor, stub_model(Contractor,
    #  :name => "MyString",
    #  :number => "MyString",
    #  :description => "MyText",
    #  :specialties => "MyText",
    #  :website => "MyString",
    #  :facebook => "MyString",
    #  :twitter => "MyString"
    #).as_new_record)
  end

  it "renders new contractor form" do
    render

    assert_select "form", :action => contractors_path, :method => "post" do

      # First Page: Essential Information
      assert_select "input#contractor_email", :name => "contractor[email]"
      assert_select "input#contractor_name", :name => "contractor[name]"
      assert_select "input#contractor_password", :name => "contractor[password]"
      assert_select "input#contractor_password_confirmation", :name => "contractor[password_confirmation]"

      # Page Two: ()
      assert_select "input#contractor_mobile_number", :name => "contractor[mobile_number]"
      assert_select "input#contractor_office_number", :name => "contractor[office_number]"


      assert_select "textarea#contractor_description", :name => "contractor[description]"
      assert_select "textarea#contractor_specialties", :name => "contractor[specialties]"
      assert_select "input#contractor_website", :name => "contractor[website]"
      assert_select "input#contractor_facebook", :name => "contractor[facebook]"
      assert_select "input#contractor_twitter", :name => "contractor[twitter]"
    end
  end

  it "has 'next' and 'previous' links"

end
