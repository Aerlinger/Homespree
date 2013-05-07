class FixPhotographableIdType < ActiveRecord::Migration
  def up
    change_column :photos, :photographable_id, :integer
  end

  def down
    change_column :photos, :photographable_id, :string
  end
end
