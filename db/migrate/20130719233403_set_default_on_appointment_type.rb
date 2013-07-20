class SetDefaultOnAppointmentType < ActiveRecord::Migration
  def change
    change_column_default :appointments, :appointment_type, "project"
  end
end
