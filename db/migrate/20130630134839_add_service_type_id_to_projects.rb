class AddServiceTypeIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :service_type_id, :integer
  end
end
