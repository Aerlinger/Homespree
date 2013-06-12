class Message < ActiveRecord::Base
  attr_accessible :author_id, :content, :thread_id

  belongs_to :messageable, polymorphic: true
end
