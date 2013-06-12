# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class JobSubcategory < ActiveRecord::Base
  attr_accessible :category_id, :name

  validates_presence_of :name
  validates_presence_of :job_category

  belongs_to :job_category
end
