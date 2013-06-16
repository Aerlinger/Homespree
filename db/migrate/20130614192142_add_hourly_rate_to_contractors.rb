class AddHourlyRateToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :hourly_rate, :decimal
  end
end
