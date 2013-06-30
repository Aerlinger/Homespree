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
#

class ProjectField < ActiveRecord::Base
  belongs_to :project_type
  attr_accessible :field_type, :name, :required, :attr_name, :project_type, :project_type_id, :field_data, :default

  serialize :field_data, Array

  def to_s
    "#{self.name} - #{self.project_type if self.project_type?}"
  end
end
