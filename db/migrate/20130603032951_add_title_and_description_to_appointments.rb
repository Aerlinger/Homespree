class AddTitleAndDescriptionToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :title, :string
    add_column :appointments, :description, :string
  end
end
