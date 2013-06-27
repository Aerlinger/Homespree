class RenameProjectSubcategoryToProjectType < ActiveRecord::Migration
  def up
    rename_table :project_subcategories, :project_types
  end

  def down
    rename_table :project_types, :project_subcategories
  end
end
