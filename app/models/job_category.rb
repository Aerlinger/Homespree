# == Schema Information
#
# Table name: job_categories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  categorizable_id   :integer
#  categorizable_type :string(255)
#

class JobCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :job_subcategories

  belongs_to :categorizable, polymorphic: true
end
