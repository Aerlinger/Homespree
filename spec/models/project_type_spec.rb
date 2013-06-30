# == Schema Information
#
# Table name: project_types
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  service_type_id :integer
#

require 'spec_helper'

describe ProjectType do

  it {should respond_to :name}
  it {should respond_to :service_type}

  it "should not be valid with empty name" do
    project_type = FactoryGirl.build(:project_type, name: "")
    project_type.should_not be_valid
  end

  it "should be valid with only a simple name" do
    project_type = FactoryGirl.build(:project_type)
    service_type = FactoryGirl.build(:service_type)
    service_type.project_types << project_type

    project_type.should be_valid
  end

end
