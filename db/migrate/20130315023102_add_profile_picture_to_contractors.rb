class AddProfilePictureToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :filename, :string, default: ""
  end
end
