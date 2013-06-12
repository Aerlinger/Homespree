class RenameJobCategoriesToJobSubcategories < ActiveRecord::Migration
  def change
    rename_column :job_subcategories, :job_subcategory_id, :job_category_id
  end
end
