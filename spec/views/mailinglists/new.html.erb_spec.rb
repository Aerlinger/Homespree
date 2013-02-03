require 'spec_helper'

describe "mailinglists/new" do
  before(:each) do
    assign(:mailinglist, stub_model(Mailinglist,
      :email => "MyString",
      :contractor => false
    ).as_new_record)
  end

  it "renders new mailinglist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mailinglists_path, :method => "post" do
      assert_select "input#mailinglist_email", :name => "mailinglist[email]"
      assert_select "input#mailinglist_contractor", :name => "mailinglist[contractor]"
    end
  end
end
