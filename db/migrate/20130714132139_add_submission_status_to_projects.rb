class AddSubmissionStatusToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :submission_status, :string
  end
end
