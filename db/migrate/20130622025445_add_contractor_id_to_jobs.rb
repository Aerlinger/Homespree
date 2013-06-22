class AddContractorIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contractor_id, :integer
  end
end
