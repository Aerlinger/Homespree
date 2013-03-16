class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :filename
      t.string :caption

      t.timestamps
    end
  end
end
