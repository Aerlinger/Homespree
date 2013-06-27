class DropHomeowners < ActiveRecord::Migration
  def change
    drop_table :contractors
    drop_table :homeowners
  end
end
