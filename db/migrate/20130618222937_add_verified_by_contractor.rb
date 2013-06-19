class AddVerifiedByContractor < ActiveRecord::Migration
  def up
    add_column :appointments, :verified_by_homeowner, :boolean, default: false
    add_column :appointments, :verified_by_contractor, :boolean, default: false
    add_column :appointments, :completed_by_homeowner, :boolean, default: false
    add_column :appointments, :completed_by_contractor, :boolean, default: false
  end

  def down
    remove_column :appointments, :verified_by_homeowner
    remove_column :appointments, :verified_by_contractor
    remove_column :appointments, :completed_by_homeowner
    remove_column :appointments, :completed_by_contractor
  end
end
