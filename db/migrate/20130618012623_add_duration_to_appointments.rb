class AddDurationToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :duration, :decimal
  end
end
