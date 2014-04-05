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

ActiveRecord::Schema.define(version: 20140405133817) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "activity_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
  end

  add_index "activities", ["trip_id"], name: "index_activities_on_trip_id"

  create_table "comments", force: true do |t|
    t.string   "text"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["activity_id"], name: "index_comments_on_activity_id"

  create_table "costs", force: true do |t|
    t.integer  "activity_id"
    t.integer  "estimated_amount"
    t.integer  "actual_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "trip_id"
  end

  add_index "costs", ["activity_id"], name: "index_costs_on_activity_id"
  add_index "costs", ["trip_id"], name: "index_costs_on_trip_id"

  create_table "schedules", force: true do |t|
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day"
    t.integer  "duration"
    t.integer  "start_hour"
    t.integer  "start_minute"
    t.integer  "trip_id"
  end

  add_index "schedules", ["activity_id"], name: "index_schedules_on_activity_id"
  add_index "schedules", ["trip_id"], name: "index_schedules_on_trip_id"

  create_table "trip_users", force: true do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trip_users", ["trip_id"], name: "index_trip_users_on_trip_id"
  add_index "trip_users", ["user_id"], name: "index_trip_users_on_user_id"

  create_table "trips", force: true do |t|
    t.string   "title"
    t.integer  "length"
    t.string   "location"
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
