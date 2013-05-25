class AddPositionToSpecialties < ActiveRecord::Migration
  def change
    add_column :specialties, :position, :integer
  end
end
