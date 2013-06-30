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
#

class ProjectField < ActiveRecord::Base
  belongs_to :project_type
  attr_accessible :field_type, :name, :required
end
