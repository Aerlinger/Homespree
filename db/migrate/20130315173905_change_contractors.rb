class ChangeContractors < ActiveRecord::Migration
  def change
    rename_column :contractors, :name, :first_name
    rename_column :contractors, :filename, :photo_filename
  end
end
