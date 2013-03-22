class Photo < ActiveRecord::Base
  attr_accessible :caption, :filename, :name

  validates_uniqueness_of :filename

  belongs_to :photographable, polymorphic: true
end
