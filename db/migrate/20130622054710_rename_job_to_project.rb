class RenameJobToProject < ActiveRecord::Migration
  def up
    rename_table :jobs, :projects
  end

  def down
    rename_table :projects, :jobs
  end
end
