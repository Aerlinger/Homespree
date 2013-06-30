require 'spec_helper'

describe "Step 1: Request" do

  let(:project) { FactoryGirl.create :project }

  before do
    #visit project_wizard_path(id: "request", project_id: project.id)
    visit "/"
    select('Interior Painting', from: :project_type_name)
    fill_in '#zipcode', with: '10025'
  end

  subject { page }

  it "has description" do
    page.should have_content("Request home services in a matter of minutes")
  end

  describe "sections" do
    it "has section for Type of Painting Project" do
      within(:css, "#project_subcategory") do
        page.should have_content("Type of Painting Project")
      end
    end

    it "has section for Type of Painting Project" do
      within(:css, "#project_subcategory") do
        page.should have_content("Type of Painting Project")
      end
    end

    it "has section for project details" do
      within(:css, "#project_details") do
        page.should have_content("Type of Painting Project")
      end
    end

  end

  it "has box for project selection"

  describe "submission" do
    before { click_link "Get Estimates!" }

    specify { page.should have_text "Review Estimates" }
  end

end