class AddImageUrlToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :image_url, :string
  end
end
