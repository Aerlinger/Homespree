class ChangeSloganTypeOnContractors < ActiveRecord::Migration
  def up
    change_column :contractors, :slogan, :text
  end

  def down
    change_column :contractors, :slogan, :string
  end
end
