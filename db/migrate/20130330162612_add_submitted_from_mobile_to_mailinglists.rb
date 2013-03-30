class AddSubmittedFromMobileToMailinglists < ActiveRecord::Migration
  def change
    add_column :mailinglists, :submitted_from_mobile, :boolean
  end
end
