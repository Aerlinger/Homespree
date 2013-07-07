class RenameFieldsToPropertiesOnProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :fields, :properties
  end
end
