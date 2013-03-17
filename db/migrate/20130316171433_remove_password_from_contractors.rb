class RemovePasswordFromContractors < ActiveRecord::Migration
  def change
    remove_column :contractors, :password
    remove_column :contractors, :password_confirmation
  end
end
