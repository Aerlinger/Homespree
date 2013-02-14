class SchemaVersion1 < ActiveRecord::Migration
  def change
    create_table "mailinglists", :force => true do |t|
      t.string   "email"
      t.boolean  "contractor", :default => false
      t.datetime "created_at",                    :null => false
      t.datetime "updated_at",                    :null => false
    end
  end
end
