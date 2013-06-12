class Message < ActiveRecord::Base
  attr_accessible :author_id, :content, :thread_id
end
