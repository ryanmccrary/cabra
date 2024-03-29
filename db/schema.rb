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

ActiveRecord::Schema.define(version: 20180424030609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "whattobring"
  end

  add_index "activities", ["name"], name: "index_activities_on_name", unique: true, using: :btree

  create_table "confirmations", force: :cascade do |t|
    t.integer  "plan_id"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "leadernotes", force: :cascade do |t|
    t.integer  "leader_id"
    t.text     "copy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "leadernotes", ["leader_id"], name: "index_leadernotes_on_leader_id", using: :btree

  create_table "leaders", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "telephone"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "unique_identifier"
    t.boolean  "plan_sent",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "leader_id"
    t.datetime "confirmation"
    t.string   "confirmation_email"
  end

  add_index "plans", ["unique_identifier"], name: "index_plans_on_unique_identifier", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.integer  "female"
    t.integer  "male"
    t.string   "additional_guides"
    t.text     "weather"
    t.text     "incidents"
    t.boolean  "incident_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["id"], name: "index_reports_on_id", using: :btree
  add_index "reports", ["trip_id"], name: "index_reports_on_trip_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "location_id"
    t.integer  "group_id"
    t.integer  "scheduled_participants"
    t.integer  "actual_participants"
    t.integer  "plan_id"
    t.string   "pickup_time"
    t.string   "dropoff_time"
    t.datetime "date"
    t.boolean  "pickup"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "lunch"
    t.integer  "report_id"
  end

  add_index "trips", ["group_id"], name: "index_trips_on_group_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
