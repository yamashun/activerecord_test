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

ActiveRecord::Schema.define(version: 20170319055007) do

  create_table "cars", force: :cascade do |t|
    t.integer  "bb_number",  limit: 4
    t.string   "car_number", limit: 255
    t.string   "maker",      limit: 255
    t.string   "car_model",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "shodans", force: :cascade do |t|
    t.integer  "bb_number",  limit: 4
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.integer  "status",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "shodans", ["bb_number"], name: "index_shodans_on_bb_number", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.integer  "car_id",          limit: 4
    t.string   "token",           limit: 255
    t.datetime "expiration_date"
    t.integer  "status",          limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "tokens", ["car_id"], name: "index_tokens_on_car_id", using: :btree

  add_foreign_key "tokens", "cars"
end
