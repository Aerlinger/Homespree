class Photo < ActiveRecord::Base
  attr_accessible :caption, :filename, :name
end
