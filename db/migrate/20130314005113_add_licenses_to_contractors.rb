class AddLicensesToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :license, :string, default: ""
    add_column :contractors, :insurance_limit, :decimal, precision: 5, scale: 2
    add_column :contractors, :bonding_limit, :decimal, precision: 5, scale: 2
  end
end
