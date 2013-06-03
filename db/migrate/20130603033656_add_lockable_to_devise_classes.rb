class AddLockableToDeviseClasses < ActiveRecord::Migration
  def up
    add_index "contractors", ["authentication_token"], :name => "index_contractors_on_authentication_token", :unique => true
    add_index "contractors", ["email"], :name => "index_contractors_on_email", :unique => true
  end
end