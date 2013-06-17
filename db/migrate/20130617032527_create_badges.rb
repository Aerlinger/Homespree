class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.integer :contractor_id
      t.string :name

      t.timestamps
    end
  end
end
