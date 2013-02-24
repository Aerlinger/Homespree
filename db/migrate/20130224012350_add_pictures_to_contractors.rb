class AddPicturesToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :pictures, :text
  end
end
