class RenameSubcategoryToJobSubcategory < ActiveRecord::Migration
  def up
    rename_table :subcategories, :job_subcategories
  end

  def down
    rename_table :job_subcategories, :subcategories
  end
end
