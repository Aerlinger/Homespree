# == Schema Information
#
# Table name: service_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  params     :text
#  position   :integer
#

class ServiceType < ActiveRecord::Base
  acts_as_list

  attr_accessible :name, :params

  # Parameters for this category:  ------------------------------------------------------------------------------------
  serialize :params, Hash

  validates_presence_of :name

  # Associations:  --------------------------------------------------------------------------------------------------
  has_many :project_types
  has_many :projects, through: :project_types

  belongs_to :contractor

  default_scope order("position")

  def to_s
    return self.name
  end
end
