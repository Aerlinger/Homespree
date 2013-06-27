class RenameProjectCategoryToServiceType < ActiveRecord::Migration
  def up
    rename_table :project_categories, :service_types
  end

  def down
    rename_table :service_types, :project_categories
  end
end
