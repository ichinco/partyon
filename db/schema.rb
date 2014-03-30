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

ActiveRecord::Schema.define(version: 20140330011434) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.integer  "cost"
    t.string   "type"
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

  create_table "trips", force: true do |t|
    t.string   "title"
    t.integer  "length"
    t.string   "location"
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
