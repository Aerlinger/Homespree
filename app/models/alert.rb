
# == Schema Information
#
# Table name: alerts
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text
#  alertable_id   :integer
#  alertable_type :string(255)
#  type           :notice_type
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Alert < ActiveRecord::Base
  attr_accessible :alertable_id, :alertable_type, :content, :title, :notice_type

  belongs_to :alertable, polymorphic: true
end
