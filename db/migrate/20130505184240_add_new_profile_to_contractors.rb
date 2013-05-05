class AddNewProfileToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :new_profile, :boolean
  end
end
