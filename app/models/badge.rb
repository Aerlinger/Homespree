class Badge < ActiveRecord::Base
  attr_accessible :contractor_id, :name

  belongs_to :contractor

  validates_presence_of :name
end
