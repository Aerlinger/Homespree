class AddGuestToUsers < ActiveRecord::Migration
  def change
    add_column :homeowners, :guest, :boolean
  end
end
