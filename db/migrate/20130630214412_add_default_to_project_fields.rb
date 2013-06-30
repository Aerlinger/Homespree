class AddDefaultToProjectFields < ActiveRecord::Migration
  def change
    add_column :project_fields, :default, :string
    add_column :project_fields, :attr_name, :string
  end
end
