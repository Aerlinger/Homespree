class ChangeAmountTypesOnContractor < ActiveRecord::Migration
  def change
    change_column :contractors, :insurance_limit, :integer
    change_column :contractors, :bonding_limit, :integer
    change_column :contractors, :hourly_rate, :integer
  end
end
