class AddParamsToJobCategories < ActiveRecord::Migration
  def change
    add_column :job_categories, :params, :text
  end
end
