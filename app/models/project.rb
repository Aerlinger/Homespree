# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string(255)
#  description   :text
#  category_id   :integer
#  contractor_id :integer
#  homeowner_id  :integer
#

class Project < ActiveRecord::Base

  # Accessors:  -------------------------------------------------------------------------------------------------------
  attr_accessor :zipcode, :category_name
  attr_accessible :zipcode, :title, :description, :category_attributes, :appointment_attributes, :category_name, :service_type_attributes

  # Serialization for dynamic project submission (HStore through Postgres):  ------------------------------------------
  serialize :properties, Hash

  # Associations:  ----------------------------------------------------------------------------------------------------
  has_one :service_type, as: :categorizable
  belongs_to :project_type
  has_many :before_photos, class_name: 'Photo', as: :photographable
  has_many :after_photos, class_name: 'Photo', as: :photographable

  belongs_to :contractor
  belongs_to :homeowner

  has_many :appointments

  # Nested Attributes:  -----------------------------------------------------------------------------------------------
  accepts_nested_attributes_for :category, :appointments, :service_type

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates_presence_of :category_name
  validate :validate_properties

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  before_create :set_category

  def validate_properties
    fields.each do |field|
      if field.required? && properties[field.name]
      end
    end
  end

  private

  def set_category
    self.category = create_category({name: category_name})
  end
end
