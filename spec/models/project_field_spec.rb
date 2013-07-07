# == Schema Information
#
# Table name: project_fields
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  field_type      :string(255)
#  required        :boolean          default(FALSE)
#  project_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  field_data      :text
#  default         :string(255)
#  attr_name       :string(255)
#  label           :string(255)
#  position        :string(255)      default("left")
#  size            :string(255)      default("normal")
#  toggleable      :boolean          default(FALSE)
#

require 'spec_helper'

describe ProjectField do

  let(:project_field) { FactoryGirl.create :project_field }

  subject { project_field }

  it { should validate_presence_of :attr_name }
  it { should validate_presence_of :field_type }

  it { should respond_to :attr_name }
  it { should respond_to :field_type }
  it { should respond_to :required }
  it { should respond_to :project_type_id }

  its(:to_s) { should eq "Window height" }
end
