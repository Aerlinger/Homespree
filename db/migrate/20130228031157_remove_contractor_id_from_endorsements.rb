class RemoveContractorIdFromEndorsements < ActiveRecord::Migration
  def change
    remove_column :specialties, :endorsements
  end
end
