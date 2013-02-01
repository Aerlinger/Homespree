class CreateEmailLists < ActiveRecord::Migration
  def change
    create_table :email_lists do |t|
      t.string :email
      t.boolean :contractor, default: false

      t.timestamps
    end
  end
end
