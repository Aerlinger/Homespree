class AddLastNameToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :last_name, :string
  end
end
