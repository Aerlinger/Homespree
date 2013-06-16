# == Schema Information
#
# Table name: job_subcategories
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  job_category_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe JobSubcategory do

  it {should respond_to :name}
  it {should respond_to :job_category}

  it "should not be valid with empty name" do
    job_subcategory = FactoryGirl.build(:job_subcategory, name: "")
    job_subcategory.should_not be_valid
  end

  it "should be valid with only a simple name" do
    job_subcategory = FactoryGirl.build(:job_subcategory)
    job_category = FactoryGirl.build(:job_category)
    job_category.job_subcategories << job_subcategory

    job_subcategory.should be_valid
  end

end
