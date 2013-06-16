class AddServiceRadiusToAddress < ActiveRecord::Migration
  def change
    remove_column :contractors, :service_radius
    add_column :addresses, :service_radius, :integer, default: 20
  end
end
