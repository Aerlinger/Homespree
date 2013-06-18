# == Schema Information
#
# Table name: badges
#
#  id            :integer          not null, primary key
#  contractor_id :integer
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Badge < ActiveRecord::Base
  attr_accessible :contractor_id, :name

  belongs_to :contractor

  validates_presence_of :name
end
