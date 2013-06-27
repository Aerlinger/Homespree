class AddPositionToServiceTypes < ActiveRecord::Migration
  def change
    add_column :service_types, :position, :integer
  end
end
