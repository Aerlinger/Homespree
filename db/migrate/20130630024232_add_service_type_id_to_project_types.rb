class AddServiceTypeIdToProjectTypes < ActiveRecord::Migration
  def change
    add_column :project_types, :service_type_id, :integer
    remove_column :project_types, :project_category_id
  end
end
