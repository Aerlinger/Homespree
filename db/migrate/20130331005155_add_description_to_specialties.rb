class AddDescriptionToSpecialties < ActiveRecord::Migration
  def change
    add_column :specialties, :description, :string
  end
end
