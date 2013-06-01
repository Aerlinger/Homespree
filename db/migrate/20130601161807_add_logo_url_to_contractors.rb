class AddLogoUrlToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :logo_url, :string
  end
end
