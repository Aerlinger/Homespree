class AddHomeownerIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :homeowner_id, :integer
  end
end
