class RemoveServiceTypeFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :service_type_id
  end
end
