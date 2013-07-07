class ModifyProjectField < ActiveRecord::Migration
  def change
    remove_column :project_fields, :name
    rename_column :project_fields, :attr_name, :field_name
  end
end
