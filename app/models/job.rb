# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string(255)
#  description :string(255)
#  category_id :integer
#

class Job < ActiveRecord::Base
  belongs_to :appointment

  validates_presence_of :name, :description
  validates_associated :categories

  has_many :categories, as: :categorizable
end
