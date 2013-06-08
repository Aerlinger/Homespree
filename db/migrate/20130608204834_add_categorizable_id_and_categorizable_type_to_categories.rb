class AddCategorizableIdAndCategorizableTypeToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :categorizable_id, :integer
    add_column :categories, :categorizable_type, :string
  end
end
