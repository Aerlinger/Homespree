# == Schema Information
#
# Table name: badges
#
#  id            :integer          not null, primary key
#  contractor_id :integer
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :text
#  image_url     :string(255)
#

class Badge < ActiveRecord::Base

  belongs_to :contractor

  validates_presence_of :name
end
