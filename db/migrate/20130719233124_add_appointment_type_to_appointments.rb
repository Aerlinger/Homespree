class AddAppointmentTypeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_type, :string
  end
end
