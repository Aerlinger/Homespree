class RenameJobSubcategoryToProjectSubcategory < ActiveRecord::Migration
  def up
    rename_table :job_subcategories, :project_subcategories
  end

  def down
    rename_table :project_subcategories, :job_subcategories
  end
end
