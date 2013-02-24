class AddEmailToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :email, :string
  end
end
