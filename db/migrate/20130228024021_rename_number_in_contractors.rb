class RenameNumberInContractors < ActiveRecord::Migration
  def change
    remove_column :contractors, :number
    add_column :contractors, :mobile_number, :string, :default => ""
    add_column :contractors, :office_number, :string, :default => ""
  end
end
