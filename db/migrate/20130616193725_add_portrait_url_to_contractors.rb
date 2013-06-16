class AddPortraitUrlToContractors < ActiveRecord::Migration
  def change
    remove_column :contractors, :logo
    add_column :contractors, :portrait_url, :string
    add_column :contractors, :logo_url, :string
  end
end
