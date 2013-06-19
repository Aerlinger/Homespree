class Remove < ActiveRecord::Migration
  def change
    remove_column :appointments, :appointment_idv
  end
end
