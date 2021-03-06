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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130820011748) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "service_radius",   default: 20
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "alerts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "alertable_id"
    t.string   "alertable_type"
    t.string   "notice_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "alerts", ["alertable_id"], name: "index_alerts_on_alertable_id"

  create_table "appointments", force: true do |t|
    t.datetime "starts_at"
    t.string   "photos"
    t.string   "reminders"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "contractor_id"
    t.string   "title"
    t.string   "description"
    t.integer  "homeowner_id"
    t.decimal  "duration"
    t.integer  "project_id"
    t.boolean  "verified_by_homeowner",   default: false
    t.boolean  "verified_by_contractor",  default: false
    t.boolean  "completed_by_homeowner",  default: false
    t.boolean  "completed_by_contractor", default: false
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "appointment_type",        default: "project"
  end

  add_index "appointments", ["address_id"], name: "index_appointments_on_address_id"
  add_index "appointments", ["contractor_id"], name: "index_appointments_on_contractor_id"
  add_index "appointments", ["homeowner_id"], name: "index_appointments_on_homeowner_id"
  add_index "appointments", ["project_id"], name: "index_appointments_on_project_id"
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "badges", force: true do |t|
    t.integer  "contractor_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description"
    t.string   "image_url"
  end

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailinglists", force: true do |t|
    t.string   "email"
    t.boolean  "contractor",            default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "notes"
    t.boolean  "submitted_from_mobile"
  end

  create_table "notification_settings", force: true do |t|
    t.boolean  "text_notifications",   default: true
    t.boolean  "email_notifications",  default: true
    t.boolean  "on_payment",           default: true
    t.boolean  "on_message",           default: true
    t.boolean  "on_scheduling",        default: true
    t.boolean  "on_deal",              default: true
    t.boolean  "featured_contractors", default: true
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id"

  create_table "payments", force: true do |t|
    t.decimal  "amount"
    t.text     "recipient"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "photos", force: true do |t|
    t.string   "name"
    t.string   "caption"
    t.string   "image_url"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "photographable_id",   limit: 255
    t.string   "photographable_type"
  end

  add_index "photos", ["photographable_id"], name: "index_photos_on_photographable_id"

  create_table "project_fields", force: true do |t|
    t.string   "field_type"
    t.boolean  "required",        default: false
    t.integer  "project_type_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "field_data"
    t.string   "default"
    t.string   "field_name"
    t.string   "label"
    t.string   "position",        default: "left"
    t.string   "size",            default: "normal"
    t.boolean  "toggleable",      default: false
  end

  add_index "project_fields", ["project_type_id"], name: "index_project_fields_on_project_type_id"

  create_table "project_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "service_type_id"
  end

  create_table "projects", force: true do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "title"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "contractor_id"
    t.integer  "homeowner_id"
    t.text     "properties"
    t.integer  "project_type_id"
    t.string   "submission_status"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"
  add_index "projects", ["contractor_id"], name: "index_projects_on_contractor_id"
  add_index "projects", ["homeowner_id"], name: "index_projects_on_homeowner_id"
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id"

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id"

  create_table "service_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "params"
    t.integer  "position"
  end

  create_table "specialties", force: true do |t|
    t.string   "name"
    t.integer  "endorser_id"
    t.integer  "contractor_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "description"
    t.integer  "position"
    t.decimal  "hourly_rate",   default: 50.0
  end

  create_table "users", force: true do |t|
    t.string   "type"
    t.string   "first_name"
    t.text     "description"
    t.text     "specialties"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "email"
    t.string   "last_name"
    t.string   "encrypted_password",               default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "company_title"
    t.string   "mobile_number"
    t.string   "office_number"
    t.string   "license"
    t.integer  "insurance_limit",        limit: 5
    t.integer  "bonding_limit",          limit: 5
    t.string   "photo_filename"
    t.text     "slogan"
    t.integer  "years_experience"
    t.integer  "failed_attempts",                  default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.boolean  "edited",                           default: false
    t.integer  "hourly_rate"
    t.string   "slug"
    t.string   "portrait_url"
    t.string   "logo_url"
    t.text     "notification_settings"
    t.boolean  "guest"
    t.boolean  "disabled",                         default: false
    t.boolean  "gmaps",                            default: true
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["first_name"], name: "index_users_on_first_name"
  add_index "users", ["hourly_rate"], name: "index_users_on_hourly_rate"
  add_index "users", ["last_name"], name: "index_users_on_last_name"
  add_index "users", ["latitude"], name: "index_users_on_latitude"
  add_index "users", ["longitude"], name: "index_users_on_longitude"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["sign_in_count"], name: "index_users_on_sign_in_count"
  add_index "users", ["years_experience"], name: "index_users_on_years_experience"

end
