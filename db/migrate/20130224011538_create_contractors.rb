class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :number
      t.text :description
      t.text :specialties
      t.string :website
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
