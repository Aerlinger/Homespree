# == Schema Information
#
# Table name: project_subcategories
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  project_category_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class ProjectSubcategory < ActiveRecord::Base
  attr_accessible :category_id, :name

  validates_presence_of :name

  belongs_to :project_category
end
