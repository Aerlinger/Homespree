class AddPositionToProjectFields < ActiveRecord::Migration
  def change
    add_column :project_fields, :size, :string, default: "normal"
    change_column_default :project_fields, :position, "left"
    change_column_default :project_fields, :required, false
  end
end
