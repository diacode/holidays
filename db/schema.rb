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

ActiveRecord::Schema.define(version: 20150414151954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "requested_days", force: :cascade do |t|
    t.date     "day",                             null: false
    t.integer  "status",              default: 0
    t.integer  "vacation_request_id",             null: false
    t.integer  "validator_id"
    t.datetime "validated_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "requested_days", ["vacation_request_id"], name: "index_requested_days_on_vacation_request_id", using: :btree
  add_index "requested_days", ["validator_id"], name: "index_requested_days_on_validator_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vacation_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vacation_requests", ["user_id"], name: "index_vacation_requests_on_user_id", using: :btree

  add_foreign_key "requested_days", "users", column: "validator_id"
  add_foreign_key "requested_days", "vacation_requests"
  add_foreign_key "vacation_requests", "users"
end
