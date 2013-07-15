# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  title             :string(255)
#  description       :text
#  category_id       :integer
#  contractor_id     :integer
#  homeowner_id      :integer
#  properties        :text
#  project_type_id   :integer
#  submission_status :string(255)
#

class Project < ActiveRecord::Base

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessor :zipcode, :project_type_name, :service_type_name, :service_type
  attr_accessible :zipcode, :title, :description, :project_type_name, :submission_status,
                  :appointment_attributes, :project_type_id, :service_type_name, :properties, :service_type

  # Serialization for dynamic project submission (HStore through Postgres):  ------------------------------------------
  serialize :properties, Hash

  # Associations:  ----------------------------------------------------------------------------------------------------
  belongs_to :project_type

  # Todo: should this be a has_one?
  belongs_to :contractor
  belongs_to :homeowner

  has_many :before_photos, class_name: 'Photo', as: :photographable
  has_many :after_photos, class_name: 'Photo', as: :photographable
  has_many :appointments

  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :appointments, :project_type, :contractor, :homeowner

  # Aliases and delegations (delegates calls to project_type):  -------------------------------------------------------
  delegate :service_type, to: :project_type
  delegate :fields, to: :project_type

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_presence_of :zipcode, :project_type
  validates_presence_of :contractor, :homeowner, :address, if: :active?
  validates :zipcode, format: RegexDefinitions::zipcode_regex
  validate :validate_fields, if: :project_type

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_create :set_project_type
  before_create :set_service_type
  before_save :convert_properties

  def to_s
    "#{project_type.to_s} #{service_type.to_s}"
  end

  def active?
    submission_status == 'active'
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

  def find_nearby_contractors(limit = 3)
    puts "The find_three_nearby_contractors is still a WIP"
    Rails.logger.warn "The find_three_nearby_contractors is still a WIP"

    #address.nearbys(20)

    Contractor.limit(limit)
  end

  private

  def validate_fields
    project_type.fields.each do |field|
      if field.required? && properties[field].blank?
        errors.add field, "must not be blank"
      end
    end
  end

  def set_project_type
    if project_type_name && ProjectType.find_by_name(project_type_name)
      self.project_type = ProjectType.find_by_name(project_type_name)
    end
  end

  def set_service_type
    if project_type.present?
      self.project_type.service_type = ServiceType.find_by_name(project_type)
    end
  end

  def convert_properties
    if project_type.present?

    end
    #self.fields.each do |field|
    #  field_name = field.name
    #  properties[field_name]
    #end
  end

end
