class RenameJobsTable < ActiveRecord::Migration
  def change
    rename_column :jobs, :name, :title
    change_column :jobs, :description, :text
  end
end
