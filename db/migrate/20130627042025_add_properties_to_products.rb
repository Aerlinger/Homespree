class AddPropertiesToProducts < ActiveRecord::Migration
  def change
    add_column :projects, :fields, :text
  end
end
