# == Schema Information
#
# Table name: alerts
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text
#  alertable_id   :integer
#  alertable_type :string(255)
#  notice_type    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Alert < ActiveRecord::Base
  belongs_to :alertable, polymorphic: true
end
