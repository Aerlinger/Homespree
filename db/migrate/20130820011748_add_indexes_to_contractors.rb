class AddIndexesToContractors < ActiveRecord::Migration
  def change
    #add_index "users", ['type', 'slug']
    #add_index "users", ['email'], unique: true
    add_index "users", ['latitude']
    add_index "users", ['longitude']
    add_index "users", ['years_experience']
    add_index "users", ['hourly_rate']
    add_index "users", ['sign_in_count']
    add_index "users", ['first_name']
    add_index "users", ['last_name']

    add_index "projects", ['category_id']
    add_index "projects", ['contractor_id']
    add_index "projects", ['homeowner_id']
    add_index "projects", ['project_type_id']

    add_index "photos", ['photographable_id']

    add_index "payments", ['user_id']

    add_index "appointments", ['contractor_id']
    add_index "appointments", ['homeowner_id']
    add_index "appointments", ['project_id']
    add_index "appointments", ['user_id']
    add_index "appointments", ['address_id']

    add_index "alerts", ['alertable_id']
  end
end
