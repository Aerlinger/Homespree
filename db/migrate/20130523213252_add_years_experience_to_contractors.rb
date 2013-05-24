class AddYearsExperienceToContractors < ActiveRecord::Migration
  def change
    add_column :contractors, :years_experience, :decimal
  end
end
