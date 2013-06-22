class RenameJobIdsToProjectIds < ActiveRecord::Migration
  def change
    rename_column :project_subcategories, :job_category_id, :project_category_id
    rename_column :appointments, :job_id, :project_id
  end
end
