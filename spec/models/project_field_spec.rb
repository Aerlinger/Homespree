# == Schema Information
#
# Table name: project_fields
#
#  id              :integer          not null, primary key
#  field_type      :string(255)
#  required        :boolean          default(FALSE)
#  project_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  field_data      :text
#  default         :string(255)
#  field_name      :string(255)
#  label           :string(255)
#  position        :string(255)      default("left")
#  size            :string(255)      default("normal")
#  toggleable      :boolean          default(FALSE)
#

require 'spec_helper'

describe ProjectField do
  let(:project_field) { FactoryGirl.create :project_field }

  subject { project_field }

  it { should validate_presence_of :field_name }
  it { should validate_presence_of :field_type }

  it { should respond_to :field_name }
  it { should respond_to :field_type }
  it { should respond_to :required }
  it { should respond_to :project_type_id }

  its(:to_s) { should eq "Window height" }

  let(:field1) { FactoryGirl.create :project_field, field_name: "window height", label: "Width", field_type: 'text_field' }
  let(:field2) { FactoryGirl.create :project_field, field_name: "width", field_type: 'text_field' }
  let(:field3) { FactoryGirl.create :project_field, field_name: "length", field_type: 'text_field' }
  let(:field4) { FactoryGirl.create :project_field, field_name: "surfaces", label: "surfaces", field_type: 'checkbox' }

  it "doesn't have null fields" do
    field1.to_s.should eq("Window height")
    field2.to_s.should eq("Width")
    field3.to_s.should eq("Length")
    field4.to_s.should eq("Surfaces")
  end

  def to_hash

  end
end
