# == Schema Information
#
# Table name: service_types
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  categorizable_id   :integer
#  categorizable_type :string(255)
#  params             :text
#  position           :integer
#

class ServiceType < ActiveRecord::Base
  attr_accessible :name, :categorizable_type, :params

  # Parameters for this category:  ------------------------------------------------------------------------------------
  serialize :params, Hash

  validates_presence_of :name

  has_many :project_types
  has_many :projects, through: :project_types

  belongs_to :contractor
  #belongs_to :categorizable, polymorphic: true

  acts_as_list

  default_scope order("position")
end
