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

  let(:project_type) { FactoryGirl.create :project_type }

  it {should respond_to :name}
  it {should respond_to :service_type}

  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }

  describe "default values" do
    let(:project_types) { ProjectType.all }

    it "includes Interior Painting" do
      project_types.first.should eq project_type
    end

    it "includes Exterior Painting" do
      project_types.last.should eq project_type
    end

  end

  it "has correct to_s" do
    "#{project_type}".should eq "Wallpaper"
  end

  describe "Can have many fields" do
    let(:field1) { FactoryGirl.create :project_field }
    let(:field2) { FactoryGirl.create :project_field }
    let(:field3) { FactoryGirl.create :project_field }
    let(:field4) { FactoryGirl.create :project_field }

    before do
      project_type.fields = [field1, field2, field3, field4]
    end

    it "is persisted" do
      project_type.should be_persisted
    end

    it "builds an association for each field" do
      project_type.fields.should include(field1)
      project_type.fields.should include(field2)
      project_type.fields.should include(field3)
      project_type.fields.should include(field4)
    end

    describe "with nested attributes for fields" do

    end

  end

  it "is not valid with empty name" do
    project_type = FactoryGirl.build(:project_type, name: "")
    project_type.should_not be_valid
  end

  it "is valid with only a simple name" do
    project_type = FactoryGirl.build(:project_type)
    service_type = FactoryGirl.build(:service_type)
    service_type.project_types << project_type

    project_type.should be_valid
  end

end
