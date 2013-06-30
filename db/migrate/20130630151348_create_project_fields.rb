class CreateProjectFields < ActiveRecord::Migration
  def change
    create_table :project_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :project_type

      t.timestamps
    end
    add_index :project_fields, :project_type_id
  end
end
