# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  categorizable_id   :integer
#  categorizable_type :string(255)
#

require 'spec_helper'

describe JobCategory do

  let(:job_category) { FactoryGirl.create(:job_category) }
  subject { job_category }

  it { should respond_to :name }
  it { should respond_to :job_subcategories }
  it { should respond_to :categorizable_type }
  it { should respond_to :categorizable_id }

  its(:job_subcategories) { should_not be_empty }

  it "should be valid by default" do
    job_category.should be_valid
  end

  it "should have many subcategories" do

  end

end
