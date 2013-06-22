class AddHomeownerIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :homeowner_id, :integer
  end
end
