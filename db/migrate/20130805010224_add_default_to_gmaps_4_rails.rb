class AddDefaultToGmaps4Rails < ActiveRecord::Migration
  def change
    add_column_default :users, :gmaps, true
  end
end
