class RemoveUnusedAttributes < ActiveRecord::Migration
  def up
    remove_columns :contractors, :new_profile, :latitude, :longitude, :pictures
  end
end
