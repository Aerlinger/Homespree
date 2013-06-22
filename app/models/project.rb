# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string(255)
#  description   :text
#  category_id   :integer
#  contractor_id :integer
#  homeowner_id  :integer
#

class Project < ActiveRecord::Base

  attr_accessor :zipcode
  attr_accessible :zipcode, :title, :description

  validates_presence_of :title, :description

  has_many :categories, as: :categorizable, class_name: "ProjectCategory"
  has_many :before_photos, class_name: 'Photo', as: :photographable
  has_many :after_photos, class_name: 'Photo', as: :photographable

  belongs_to :contractor
  belongs_to :homeowner

  has_many :appointments
end
