class RemoveCategorizableIdFromServiceTypes < ActiveRecord::Migration
  def change
    remove_column :service_types, :categorizable_id
    remove_column :service_types, :categorizable_type
  end
end
