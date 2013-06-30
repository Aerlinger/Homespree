class AddFieldDataToProjectFields < ActiveRecord::Migration
  def change
    add_column :project_fields, :field_data, :text
  end
end
