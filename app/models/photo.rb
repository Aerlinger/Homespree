class Photo < ActiveRecord::Base
  attr_accessible :caption, :filename, :name

  validates_uniqueness_of :filename
end
