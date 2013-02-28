class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.string :name
      t.string :endorsements
      t.integer :endorser_id
      t.integer :contractor_id

      t.timestamps
    end
  end
end
