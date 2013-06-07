class Photo < ActiveRecord::Base
  attr_accessible :contractor_id, :caption, :image_url, :name, :photo, :image

  #validates_uniqueness_of :image_url, message: "already exists on the server"

  belongs_to :photographable, polymorphic: true

  before_create :default_name

  def default_name
    self.name ||= File.basename(image_url, '.*').titleize if image_url
  end

end