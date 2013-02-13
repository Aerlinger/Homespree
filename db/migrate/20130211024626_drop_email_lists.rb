class DropEmailLists < ActiveRecord::Migration
  def change
    drop_table :email_lists
  end
end
