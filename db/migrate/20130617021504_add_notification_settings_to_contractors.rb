class AddNotificationSettingsToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :notification_settings, :text
  end
end
