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

class ProjectType < ActiveRecord::Base
  attr_accessible :name, :service_type_id

  # Validations:  --------------------------------------------------------------------------------------------------
  validates_presence_of :name
  validates_uniqueness_of :name

  # Associations:  -------------------------------------------------------------------------------------------------
  belongs_to :service_type

  has_many :fields, class_name: "ProjectField"
  has_many :projects

  # Nested Attributes:  --------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :fields, allow_destroy: true

  def fields_attributes_list
    fields.collect do |field|
      field.attr_name.to_sym
    end
  end

  def to_s
    name
  end

  scope :collection, Proc.new {
    ProjectType.all.map { |type| [type.name.titleize, type.name] }
  }
end
