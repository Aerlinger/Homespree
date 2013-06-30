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
  attr_accessible :category_id, :name

  validates_presence_of :name

  belongs_to :service_type
  has_many :projects

end
