class RemoveAddressIdFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :address_id
  end
end
