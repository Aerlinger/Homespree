# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  title           :string(255)
#  description     :text
#  category_id     :integer
#  contractor_id   :integer
#  homeowner_id    :integer
#  properties      :text
#  project_type_id :integer
#

class Project < ActiveRecord::Base

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessor :zipcode, :project_type_name, :service_type_name
  attr_accessible :zipcode, :title, :description, :project_type_name, :appointment_attributes, :project_type_id

  # Serialization for dynamic project submission (HStore through Postgres):  ------------------------------------------
  serialize :properties, Hash

  # Associations:  ----------------------------------------------------------------------------------------------------
  belongs_to :project_type
  belongs_to :contractor
  belongs_to :homeowner

  has_many :before_photos, class_name: 'Photo', as: :photographable
  has_many :after_photos, class_name: 'Photo', as: :photographable
  has_many :appointments
  has_many :fields, through: :project_type

  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :appointments, :project_type, :contractor, :homeowner

  # Alias method (delegates calls to project_type):  ------------------------------------------------------------------
  alias_method :service_type, :project_type
  alias_method :fields, :project_type

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_presence_of :zipcode
  validate :validate_properties

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_create :set_project_type

  def validate_properties
    project_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end

  def to_s
    "#{project_type.to_s} #{service_type.to_s}"
  end

  private

  def set_project_type
    self.project_type = ProjectType.create(name: project_type_name)
  end

end
