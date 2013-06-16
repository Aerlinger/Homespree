# == Schema Information
#
# Table name: notification_settings
#
#  id                   :integer          not null, primary key
#  text_notifications   :boolean          default(TRUE)
#  email_notifications  :boolean          default(TRUE)
#  on_payment           :boolean          default(TRUE)
#  on_message           :boolean          default(TRUE)
#  on_scheduling        :boolean          default(TRUE)
#  on_deal              :boolean          default(TRUE)
#  featured_contractors :boolean          default(TRUE)
#  notifiable_id        :integer
#  notifiable_type      :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class NotificationSettings < ActiveRecord::Base
  attr_protected

  belongs_to :notifiable, polymorphic: true
end
