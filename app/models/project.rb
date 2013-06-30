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
  attr_accessible :zipcode, :title, :description, :project_type_name, :appointment_attributes, :project_type_id, :service_type_name

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

  # Aliases and delegations (delegates calls to project_type):  -------------------------------------------------------
  delegate :service_type, to: :project_type
  delegate :fields, to: :project_type

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_presence_of :zipcode
  validates :zipcode, format: RegexDefinitions::zipcode_regex
  validate :validate_properties, if: :project_type

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
    self.project_type = ProjectType.find_by_name(project_type_name)
    return nil
  end

  def fully_valid?
    incomplete_params.blank?
  end

  def incomplete_params
    incompletes = []
    incompletes << :appointment if appointments.blank?
    incompletes << :contractor if contractor.blank?
    incompletes << :description if description.blank?

    return incompletes
  end

end
