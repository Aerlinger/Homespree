class RenameUserTypeToTypeOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :user_type, :type
  end
end
