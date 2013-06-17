class AddHourlyRateToSpecialties < ActiveRecord::Migration
  def change
    add_column :specialties, :hourly_rate, :decimal, default: 50
  end
end
