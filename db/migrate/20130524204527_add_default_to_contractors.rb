class AddDefaultToContractors < ActiveRecord::Migration
  def change
    change_column_default :contractors, :new_profile, default: true
  end
end
