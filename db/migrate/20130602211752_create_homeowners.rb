class CreateHomeowners < ActiveRecord::Migration
  def change
    change_table :homeowners do |t|
      t.string :first_name
      t.string :last_name
      t.integer :address_id
      t.integer :photos_id
      t.integer :appointments_id
    end
  end
end
