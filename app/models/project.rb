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

  attr_accessor :zipcode, :category_name
  attr_accessible :zipcode, :title, :description, :category_attributes, :appointment_attributes, :category_name

  validates_presence_of :category_name

  has_one :service_type, as: :categorizable
  has_many :before_photos, class_name: 'Photo', as: :photographable
  has_many :after_photos, class_name: 'Photo', as: :photographable

  belongs_to :contractor
  belongs_to :homeowner

  has_many :appointments

  accepts_nested_attributes_for :category, :appointments

  before_create :set_category

  private

  def set_category
    self.category = create_category({name: category_name})
  end
end
