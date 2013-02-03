require 'spec_helper'

describe "mailinglists/edit" do
  before(:each) do
    @mailinglist = assign(:mailinglist, stub_model(Mailinglist,
      :email => "MyString",
      :contractor => false
    ))
  end

  it "renders the edit mailinglist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mailinglists_path(@mailinglist), :method => "post" do
      assert_select "input#mailinglist_email", :name => "mailinglist[email]"
      assert_select "input#mailinglist_contractor", :name => "mailinglist[contractor]"
    end
  end
end
