class AddMessageToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :message, :string
  end
end
