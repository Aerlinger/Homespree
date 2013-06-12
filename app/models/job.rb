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
  validates_presence_of :name, :description
  validates_associated :categories

  has_many :job_categories, as: :categorizable
  has_many :before_photos, class_name: 'Photo', as: :photographable
  has_many :after_photos, class_name: 'Photo', as: :photographable

  belongs_to :appointment
end
