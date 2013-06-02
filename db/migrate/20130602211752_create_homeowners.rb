class CreateHomeowners < ActiveRecord::Migration
  def change
    create_table :homeowners do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.reference :address
      t.reference :photos
      t.reference :appointments

      t.timestamps
    end
  end
end
