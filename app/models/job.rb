# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Job < ActiveRecord::Base
  belongs_to :appointment

  has_many :categories, as: :categorizable
end
