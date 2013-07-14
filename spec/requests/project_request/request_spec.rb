require 'spec_helper'

describe "Step 1: Request" do
  let(:project) { FactoryGirl.create :project }
  subject { page }

  before(:all) do
    ProjectType.find_or_create_by_name "Interior painting"
    ProjectType.find_or_create_by_name "Exterior painting"
  end

  before do
    visit "/"
    select('Interior painting', from: "project_project_type_id")
    fill_in 'zipcode', with: '10025'
  end

  it "is at root path" do
    page.current_path.should eq "/"
  end

  it "has description" do
    page.should have_content("Stress-free home improvement.")
  end

  describe "sections" do
    before do
      click_button "Get started"
    end

    it { should have_content "Interior painting" }
    it { should have_selector "#service_types" }
    it { should have_selector "#project_types" }

    it { should have_content "previous" }
    it { should have_selector "input[value=next]" }
    specify { save_and_open_page }

    describe "Click next" do
      before do
        click_button "next"
      end

      specify { save_and_open_page }
    end
  end
end