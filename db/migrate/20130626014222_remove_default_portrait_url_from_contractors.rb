class RemoveDefaultPortraitUrlFromContractors < ActiveRecord::Migration
  def change
    change_column_default :contractors, :portrait_url, ""
  end
end
