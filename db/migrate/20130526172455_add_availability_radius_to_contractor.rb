class AddAvailabilityRadiusToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :availability_radius, :decimal
  end
end
