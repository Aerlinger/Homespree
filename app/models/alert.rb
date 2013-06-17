class Alert < ActiveRecord::Base
  attr_accessible :alertable_id, :alertable_type, :content, :title, :type
end
