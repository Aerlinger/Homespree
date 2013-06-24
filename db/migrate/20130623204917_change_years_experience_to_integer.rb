class ChangeYearsExperienceToInteger < ActiveRecord::Migration
  def change
    change_column :contractors, :years_experience, :integer
  end
end
