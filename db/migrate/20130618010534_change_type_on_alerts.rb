class ChangeTypeOnAlerts < ActiveRecord::Migration
  def change
    change_column :alerts, :type, :notice_type
  end
end
