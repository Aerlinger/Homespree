class AddSlugToContractor < ActiveRecord::Migration
  def change
    add_column :contractors, :slug, :string
  end
end
