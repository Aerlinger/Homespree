# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  author_id  :integer
#  thread_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  attr_accessible :author_id, :content, :thread_id

  belongs_to :messageable, polymorphic: true
end
