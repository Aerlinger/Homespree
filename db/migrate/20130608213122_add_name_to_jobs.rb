class AddNameToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :name, :string
    add_column :jobs, :description, :string
  end
end
