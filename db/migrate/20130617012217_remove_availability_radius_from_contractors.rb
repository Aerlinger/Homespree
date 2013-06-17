class RemoveAvailabilityRadiusFromContractors < ActiveRecord::Migration
  def change
    remove_column :contractors, :availability_radius
  end
end
