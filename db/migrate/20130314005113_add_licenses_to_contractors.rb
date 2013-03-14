class AddLicensesToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :license, :string
    add_column :contractors, :insurance_limit, :decimal
    add_column :contractors, :bonding_limit, :decimal
  end
end
