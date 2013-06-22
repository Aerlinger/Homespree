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

  # Parameters for this category:  --------------------------------------------------------------------------------------------------
  #
  # Parameter Types:
  #   Array of Strings
  #   String Enum
  #   Integer (e.g. Dimensions)
  #   Float (e.g. Dimensions)
  #   Boolean (YES/NO)
  #   Boolean (Check mark)
  serialize :params, Hash

  validates_presence_of :name

  has_many :subcategories, class_name: "JobSubcategory"

  belongs_to :categorizable, polymorphic: true
end
