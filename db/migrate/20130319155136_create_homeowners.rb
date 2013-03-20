class CreateHomeowners < ActiveRecord::Migration
  def change
    create_table :homeowners do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
