class AddLabelToProjectFields < ActiveRecord::Migration
  def change
    add_column :project_fields, :label, :string
    add_column :project_fields, :position, :string
  end
end
