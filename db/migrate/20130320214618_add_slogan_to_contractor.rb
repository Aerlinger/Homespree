class AddSloganToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :slogan, :string
  end
end
