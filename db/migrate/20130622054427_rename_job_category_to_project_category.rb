class RenameJobCategoryToProjectCategory < ActiveRecord::Migration
  def up
    rename_table :job_categories, :project_categories
  end

  def down
    rename_table :project_categories, :job_categories
  end
end
