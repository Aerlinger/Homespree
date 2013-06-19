class RenameNoticeTypeOnAlerts < ActiveRecord::Migration
  def up
    rename_column :alerts, :notifice_type, :notice_type
  end

  def down
    rename_column :alerts, :notice_type, :notifice_type
  end
end
