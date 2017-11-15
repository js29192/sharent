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

ActiveRecord::Schema.define(version: 20171114102031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beds", force: :cascade do |t|
    t.integer  "bed_number"
    t.integer  "room_id"
    t.integer  "user_id"
    t.boolean  "booked"
    t.date     "expected_booking_date"
    t.date     "expected_vacancy_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enquiries", force: :cascade do |t|
    t.string   "full_name"
    t.integer  "mobile_number"
    t.integer  "number_of_seats"
    t.integer  "pg_id"
    t.integer  "room_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "floors", force: :cascade do |t|
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pgs", force: :cascade do |t|
    t.string   "pg_name",          null: false
    t.string   "address"
    t.string   "pin_code"
    t.integer  "user_id"
    t.integer  "normal_bed_price"
    t.integer  "ac_bed_price"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "area_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "pg_id"
    t.integer  "room_number"
    t.integer  "room_type_id"
    t.integer  "floor_id"
    t.integer  "number_of_beds"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "full_name"
    t.integer  "mobile_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "owner"
    t.boolean  "tenant"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
