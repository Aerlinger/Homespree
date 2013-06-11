class AddEditedToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :edited, :boolean, default: false
  end
end
