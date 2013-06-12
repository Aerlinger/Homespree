class RenameJobSubcategories < ActiveRecord::Migration
  def change
    rename_column :job_subcategories, :category_id, :job_subcategory_id
  end
end
