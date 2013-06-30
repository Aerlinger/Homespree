require 'spec_helper'

describe "Step 1: Request" do

  let(:project) { FactoryGirl.create :project }

  before do
    #visit project_wizard_path(id: "request", project_id: project.id)
    visit "/"
    select('Interior Painting', from: "project_project_type_name")
    fill_in 'zipcode', with: '10025'
  end

  subject { page }

  it "is at root path" do
    page.current_path.should eq "/"
  end

  it "has description" do
    page.should have_content("Request home services in a matter of minutes")
  end

  describe "sections" do
    before do
      click_button "Get started"
    end

    xit "has section for Type of Painting Project" do
      within(:css, "#project_subcategory") do
        page.should have_content("Type of Painting Project")
      end
    end

    xit "has section for Type of Painting Project" do
      within(:css, "#project_subcategory") do
        page.should have_content("Type of Painting Project")
      end
    end

    xit "has section for project details" do
      within(:css, "#project_details") do
        page.should have_content("Type of Painting Project")
      end
    end

  end

end