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

ActiveRecord::Schema.define(version: 20140619194948) do

  create_table "budgets", force: true do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.string   "month"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
  end

  add_index "budgets", ["month"], name: "index_budgets_on_month", using: :btree
  add_index "budgets", ["user_id"], name: "index_budgets_on_user_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "invoice_address_street"
    t.integer  "invoice_address_zip"
    t.string   "invoice_address_city"
    t.string   "invoice_address_country"
    t.string   "contact_name"
    t.string   "contact_email"
    t.integer  "contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offices", force: true do |t|
    t.string   "name"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunities", force: true do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "software"
    t.integer  "software_margin"
    t.integer  "software_rate"
    t.integer  "semi"
    t.integer  "semi_margin"
    t.integer  "semi_rate"
    t.integer  "production"
    t.integer  "production_margin"
    t.integer  "production_rate"
    t.integer  "ads"
    t.integer  "ads_margin"
    t.integer  "ads_rate"
    t.integer  "other"
    t.integer  "other_margin"
    t.integer  "other_rate"
    t.integer  "total_margin"
    t.integer  "total_revenue"
    t.integer  "weighted_margin"
    t.integer  "weighted_revenue"
    t.datetime "closing_date"
    t.integer  "probability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opportunities", ["client_id"], name: "index_opportunities_on_client_id", using: :btree
  add_index "opportunities", ["user_id"], name: "index_opportunities_on_user_id", using: :btree

  create_table "sales", force: true do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "software"
    t.integer  "software_margin"
    t.integer  "software_rate"
    t.integer  "semi"
    t.integer  "semi_margin"
    t.integer  "semi_rate"
    t.integer  "production"
    t.integer  "production_margin"
    t.integer  "production_rate"
    t.integer  "ads"
    t.integer  "ads_margin"
    t.integer  "ads_rate"
    t.integer  "other"
    t.integer  "other_margin"
    t.integer  "other_rate"
    t.integer  "margin"
    t.integer  "revenue"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id", using: :btree
  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "office_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.string   "auth_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["office_id"], name: "index_users_on_office_id", using: :btree
  add_index "users", ["password_reset_token"], name: "index_users_on_password_reset_token", using: :btree

end
