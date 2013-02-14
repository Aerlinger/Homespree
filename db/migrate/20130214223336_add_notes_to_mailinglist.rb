class AddNotesToMailinglist < ActiveRecord::Migration
  def change
    add_column :mailinglists, :notes, :text
  end
end
