class Photo < ActiveRecord::Base
  attr_accessible :contractor_id, :caption, :image_url, :name, :photo, :image

  validates_uniqueness_of :image_url, message: "already exists on the server"

  belongs_to :photographable, polymorphic: true

  mount_uploader :photo, PhotoUploader
end