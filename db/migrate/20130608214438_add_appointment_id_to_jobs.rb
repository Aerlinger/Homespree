class AddAppointmentIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :appointment_id, :integer
  end
end
