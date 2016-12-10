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

ActiveRecord::Schema.define(version: 20161210021530) do

  create_table "food_trucks", force: :cascade do |t|
    t.text     "name"
    t.text     "cleanURL"
    t.float    "rating"
    t.string   "phone"
    t.string   "MF_open"
    t.string   "MF_close"
    t.string   "Sa_open"
    t.string   "Sa_close"
    t.string   "Su_open"
    t.string   "Su_close"
    t.string   "genreBig"
    t.string   "genreSmall1"
    t.string   "genreSmall2"
    t.text     "location"
    t.text     "blurb"
    t.decimal  "long"
    t.decimal  "lat"
    t.text     "intersection"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string   "type"
    t.text     "name"
    t.decimal  "price"
    t.text     "comments"
    t.integer  "food_truck_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "foods", ["food_truck_id"], name: "index_foods_on_food_truck_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "food_truck_id"
    t.text     "title"
    t.text     "owner"
    t.text     "email"
    t.datetime "date"
    t.text     "comment"
    t.decimal  "overall"
    t.integer  "quality"
    t.integer  "speed"
    t.integer  "quantity"
    t.integer  "bang"
    t.integer  "friendliness"
    t.boolean  "display_rev"
    t.string   "owner_ip"
    t.boolean  "staff"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reviews", ["food_truck_id"], name: "index_reviews_on_food_truck_id"

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visits", force: :cascade do |t|
    t.datetime "timestamp"
    t.string   "ip"
    t.boolean  "public"
    t.integer  "food_truck_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "visits", ["food_truck_id"], name: "index_visits_on_food_truck_id"

end
