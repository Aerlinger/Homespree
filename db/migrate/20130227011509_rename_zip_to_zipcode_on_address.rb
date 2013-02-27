class RenameZipToZipcodeOnAddress < ActiveRecord::Migration
  def change
    rename_column :addresses, :zip, :zipcode
  end
end
