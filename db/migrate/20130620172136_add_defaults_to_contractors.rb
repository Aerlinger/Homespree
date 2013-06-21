class AddDefaultsToContractors < ActiveRecord::Migration
  def change
    change_column_default :contractors, :portrait_url, "/assets/images/contractor_profiles/portrait_default.jpg"
    change_column_default :contractors, :logo_url, "/assets/images/contractor_profiles/logo_default.jpg"
  end
end
