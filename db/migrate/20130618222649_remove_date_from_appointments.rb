class RemoveDateFromAppointments < ActiveRecord::Migration
  def up
    remove_column :appointments, :date
    rename_column :appointments, :time, :starts_at
  end

  def down
    add_column :appointments, :date, :datetime
  end
end
