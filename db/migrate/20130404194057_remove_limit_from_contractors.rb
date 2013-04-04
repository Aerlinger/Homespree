class RemoveLimitFromContractors < ActiveRecord::Migration
  def change
    change_column :contractors, :slogan, :text, limit: nil
  end
end
