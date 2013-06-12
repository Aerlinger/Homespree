class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :author_id
      t.integer :thread_id

      t.timestamps
    end
  end
end
