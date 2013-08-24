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

### ----------------------------------------------------------------------------------------------------------------
# +ProjectField+ ActiveModel to Encapsulate the data revolving around Dynamic Project Forms
#
#  Default ordering for dynamic fields:
#
#  == Required Attributes ==
#
#   - field_name (Symbol):
#       (ex - :wall_1, :wall_2)
#   - field_type (Symbol):
#       (ex - :text_field, :check_field)
#
#
#  == Optional Attributes ==
#
#   - field_data: (Array/Hash)
#       (ex - [:walls, :ceiling, :trim, :doors, :windows])
#
#   - label: (String)
#       (ex - "Wall 1 (Square Feet)")
#
#   - position: (enum: [:left, :right])
#       (ex - :left)
#
#   - size: (enum: [:tiny, :small, :normal, :large])
#       (ex - :left)
#
#   - default: (String/Boolean)
#       (ex - "Wood", true)
#
#   - required: (True/False)
#       True if this field is required
#
#   - toggleable: True/False
#       True if this field can be enabled/disabled by a check box.
#
class ProjectField < ActiveRecord::Base

  belongs_to :project_type

  validates_presence_of :field_name, :field_type

  serialize :field_data, Array

  def to_s
    field_name.try(:humanize)
  end

  def to_sym
    field_name.underscore.gsub(' ', '_').to_sym if field_name
  end
end
