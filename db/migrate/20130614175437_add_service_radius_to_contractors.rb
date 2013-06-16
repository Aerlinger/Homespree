class AddServiceRadiusToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :service_radius, :integer, default: 20
  end
end
