class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.integer  "homeowner_id"
      t.integer  "contractor_id"
      t.string   "user_type"
      t.string   "first_name"
      t.text     "description"
      t.text     "specialties"
      t.string   "website"
      t.string   "facebook"
      t.string   "twitter"
      t.datetime "created_at",                                                                                             :null => false
      t.datetime "updated_at",                                                                                             :null => false
      t.string   "email",                                                                                                  :null => false
      t.string   "last_name"
      t.string   "encrypted_password",                  :default => "",                                                    :null => false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",                       :default => 0
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.string   "company_title"
      t.string   "mobile_number"
      t.string   "office_number"
      t.string   "license"
      t.integer  "insurance_limit",        :limit => 5
      t.integer  "bonding_limit",          :limit => 5
      t.string   "photo_filename"
      t.text     "slogan"
      t.integer  "years_experience"
      t.integer  "failed_attempts",                     :default => 0
      t.string   "unlock_token"
      t.datetime "locked_at"
      t.string   "authentication_token"
      t.boolean  "edited",                              :default => false
      t.integer  "hourly_rate"
      t.string   "slug"
      t.string   "portrait_url"
      t.string   "logo_url"
      t.text     "notification_settings"
      t.boolean  "guest"
    end

    add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
    add_index "users", ["email"], :name => "index_users_on_email", :unique => true
    add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

  def down
    drop_table :users
  end
end
