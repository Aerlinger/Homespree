class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.datetime :time
      t.integer :address_id
      t.string :photos
      t.string :reminders

      t.timestamps
    end
  end
end
