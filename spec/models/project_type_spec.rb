# == Schema Information
#
# Table name: project_subcategories
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  project_category_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'spec_helper'

describe ProjectType do

  it {should respond_to :name}
  it {should respond_to :project_category}

  it "should not be valid with empty name" do
    project_subcategory = FactoryGirl.build(:project_subcategory, name: "")
    project_subcategory.should_not be_valid
  end

  it "should be valid with only a simple name" do
    project_subcategory = FactoryGirl.build(:project_subcategory)
    project_category = FactoryGirl.build(:project_category)
    project_category.subcategories << project_subcategory

    project_subcategory.should be_valid
  end

end
