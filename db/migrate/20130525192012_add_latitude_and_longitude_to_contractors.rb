class AddLatitudeAndLongitudeToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :latitude, :float
    add_column :contractors, :longitude, :float
  end
end
