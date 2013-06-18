class AddJobIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :job_id, :integer
  end
end
