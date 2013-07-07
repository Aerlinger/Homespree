class RenameProopertiesToFields < ActiveRecord::Migration
  def change
    rename_column :projects, :properties, :fields
  end
end
