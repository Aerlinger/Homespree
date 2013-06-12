class RenameCategoryToJobCategory < ActiveRecord::Migration
  def up
    rename_table :categories, :job_categories
  end

  def down
    rename_table :job_categories, :categories
  end
end
