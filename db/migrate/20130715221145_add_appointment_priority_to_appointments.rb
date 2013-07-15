class AddAppointmentPriorityToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :priority, :string
  end
end
