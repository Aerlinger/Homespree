class AddToggleableToProjectFields < ActiveRecord::Migration
  def change
    add_column :project_fields, :toggleable, :boolean, default: false
  end
end
