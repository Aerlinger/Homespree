# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)
#  description :text(255)
#  category_id :integer
#

class Job < ActiveRecord::Base

  attr_accessor :zipcode
  attr_accessible :zipcode, :title, :description

  validates_presence_of :title, :description

  has_many :categories, as: :categorizable, class_name: "JobCategory"
  has_many :before_photos, class_name: 'Photo', as: :photographable
  has_many :after_photos, class_name: 'Photo', as: :photographable

  has_many :appointments
end
