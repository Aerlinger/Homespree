class AddDefaultToGmaps4Rails < ActiveRecord::Migration
  def change
    change_column_default :users, :gmaps, true
  end
end
