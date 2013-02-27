class AddContractorIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :contractor_id, :integer
  end
end
