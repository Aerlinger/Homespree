class AddPaymentIdToHomeowner < ActiveRecord::Migration
  def change
    add_column :payments, :user_id, :integer
    add_column :users, :gmaps, :boolean #not mandatory, see wiki
  end
end
