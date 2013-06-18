# == Schema Information
#
# Table name: job_subcategories
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  job_category_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class JobSubcategory < ActiveRecord::Base
  attr_accessible :category_id, :name

  validates_presence_of :name

  belongs_to :job_category
end
