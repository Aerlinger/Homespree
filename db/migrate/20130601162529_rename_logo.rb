class RenameLogo < ActiveRecord::Migration
  def up
    rename_column :contractors, :logo_url, :logo
  end

  def down
    rename_column :contractors, :logo, :logo_url
  end
end
