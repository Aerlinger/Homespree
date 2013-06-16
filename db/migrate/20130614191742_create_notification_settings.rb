class CreateNotificationSettings < ActiveRecord::Migration
  def change
    create_table :notification_settings do |t|
      t.boolean :text_notifications, default: true
      t.boolean :email_notifications, default: true
      t.boolean :on_payment, default: true
      t.boolean :on_message, default: true
      t.boolean :on_scheduling, default: true
      t.boolean :on_deal, default: true
      t.boolean :featured_contractors, default: true
      t.integer :notifiable_id
      t.string :notifiable_type

      t.timestamps
    end
  end
end
