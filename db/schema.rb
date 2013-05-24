# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130523213252) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "appointments", :force => true do |t|
    t.date     "date"
    t.datetime "time"
    t.integer  "address_id"
    t.string   "photos"
    t.string   "reminders"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "contractor_id"
  end

  create_table "contractors", :force => true do |t|
    t.string   "first_name"
    t.text     "description"
    t.text     "specialties"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.datetime "created_at",                                                           :null => false
    t.datetime "updated_at",                                                           :null => false
    t.text     "pictures"
    t.string   "email",                                                                :null => false
    t.string   "last_name"
    t.string   "encrypted_password",                                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "company_title"
    t.string   "mobile_number"
    t.string   "office_number"
    t.string   "license"
    t.decimal  "insurance_limit",        :precision => 5, :scale => 2
    t.decimal  "bonding_limit",          :precision => 5, :scale => 2
    t.string   "photo_filename"
    t.text     "slogan"
    t.boolean  "new_profile"
    t.decimal  "years_experience"
  end

  add_index "contractors", ["reset_password_token"], :name => "index_contractors_on_reset_password_token", :unique => true

  create_table "homeowners", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mailinglists", :force => true do |t|
    t.string   "email"
    t.boolean  "contractor",            :default => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.text     "notes"
    t.boolean  "submitted_from_mobile"
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "caption"
    t.string   "image_url"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "photographable_id",   :limit => 255
    t.string   "photographable_type"
  end

  create_table "specialties", :force => true do |t|
    t.string   "name"
    t.integer  "endorser_id"
    t.integer  "contractor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "description"
  end

end
