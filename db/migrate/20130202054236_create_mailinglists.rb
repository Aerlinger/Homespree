class CreateMailinglists < ActiveRecord::Migration
  def change
    create_table :mailinglists do |t|
      t.string :email
      t.boolean :contractor, default: false

      t.timestamps
    end
  end
end
