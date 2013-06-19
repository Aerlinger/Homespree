class RemoveAddressIdFromHomeowners < ActiveRecord::Migration
  def change
    remove_column :homeowners, :address_id
  end
end
