class RemoveAppointmentIdFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :appointment_id
  end
end
