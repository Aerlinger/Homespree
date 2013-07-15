class AddMeetingTypeToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_type, :string, default: "project"
  end
end
