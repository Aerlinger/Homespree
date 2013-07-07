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
  let(:service_type) { project_type.service_type }

  subject { project_type }

  it { should validate_presence_of :name }

  its("service_type.name") { should include "Painting" }
  its("service_type.project_types") { should eq [project_type] }
  its(:name) { should include "Wallpaper" }
  its(:to_s) { should include "Wallpaper" }

  specify { ProjectType.where("name LIKE ?", "%Wallpaper%").should_not be_nil }

  describe "has many fields" do
    let(:field1) { FactoryGirl.create :project_field }
    let(:field2) { FactoryGirl.create :project_field }
    let(:field3) { FactoryGirl.create :project_field }
    let(:field4) { FactoryGirl.create :project_field }

    before do
      project_type.fields << field1
      project_type.fields << field2
      project_type.fields << field3
      project_type.fields << field4
    end

    its(:fields) { should eq [field1, field2, field3, field4] }
  end
end
