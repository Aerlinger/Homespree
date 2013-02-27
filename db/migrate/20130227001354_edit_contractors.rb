class EditContractors < ActiveRecord::Migration
  def up
    add_column :contractors, :password, :string, :null => false, :default => ""
    add_column :contractors, :password_confirmation, :string, :null => false, :default => ""
    change_column :contractors, :email, :string, :null => false, default: ""
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
