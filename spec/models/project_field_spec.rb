# == Schema Information
#
# Table name: project_fields
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  field_type      :string(255)
#  required        :boolean
#  project_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  field_data      :text
#  default         :string(255)
#  attr_name       :string(255)
#  label           :string(255)
#  position        :string(255)
#

require 'spec_helper'

describe ProjectField do
  it { should respond_to :field_type }
  it { should respond_to :required }
  it { should respond_to :project_type_id }
  it { should respond_to :name }
end
