require 'spec_helper'

describe "contractors/show" do
  before(:each) do
    @contractor = assign(:contractor, stub_model(Contractor,
      :name => "Name",
      :number => "Number",
      :description => "MyText",
      :specialties => "MyText",
      :website => "Website",
      :facebook => "Facebook",
      :twitter => "Twitter"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Number/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Website/)
    rendered.should match(/Facebook/)
    rendered.should match(/Twitter/)
  end
end
