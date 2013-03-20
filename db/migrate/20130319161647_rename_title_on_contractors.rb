class RenameTitleOnContractors < ActiveRecord::Migration
  def change
    rename_column :contractors, :title, :company_title
  end
end
