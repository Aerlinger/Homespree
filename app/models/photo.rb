# == Schema Information
#
# Table name: photos
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  caption             :string(255)
#  image_url           :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  photographable_id   :integer
#  photographable_type :string(255)
#

class Photo < ActiveRecord::Base
  attr_accessible :contractor_id, :caption, :image_url, :name, :photo, :image

  belongs_to :photographable, polymorphic: true

  before_create :default_name

  def default_name
    self.name ||= File.basename(image_url, '.*').titleize if image_url
  end

end
