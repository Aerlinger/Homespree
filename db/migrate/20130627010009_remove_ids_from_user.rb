class RemoveIdsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :homeowner_id
    remove_column :users, :contractor_id
  end
end
