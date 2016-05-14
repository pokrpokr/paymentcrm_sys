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

ActiveRecord::Schema.define(version: 20160512054915) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "bank_account",       limit: 255
    t.string   "bank_account_no",    limit: 255
    t.string   "bank_type",          limit: 255
    t.string   "bank_phone",         limit: 255
    t.string   "account_type",       limit: 255
    t.string   "paypassword_digest", limit: 255
    t.string   "area",               limit: 255
    t.integer  "balance",            limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "basics", force: :cascade do |t|
    t.integer  "finance_id",         limit: 4
    t.string   "finance_type",       limit: 255
    t.integer  "userid",             limit: 4
    t.string   "type",               limit: 255
    t.integer  "pay_account",        limit: 4
    t.string   "to_bank_account",    limit: 255
    t.string   "to_bank_account_no", limit: 255
    t.string   "to_bank_type",       limit: 255
    t.decimal  "money",                          precision: 10
    t.integer  "tousername",         limit: 4
    t.string   "info",               limit: 255
    t.string   "pay_info",           limit: 255
    t.datetime "pay_time"
    t.datetime "receive_time"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "orderinfos", force: :cascade do |t|
    t.integer  "order_id",       limit: 4
    t.string   "buyer_account",  limit: 255
    t.string   "seller_account", limit: 255
    t.string   "product_info",   limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_id",     limit: 255
    t.string   "order_info",   limit: 255
    t.string   "order_status", limit: 255
    t.string   "order_sum",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "u_orelations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "real_name",       limit: 255
    t.string   "user_type",       limit: 255
    t.string   "phone",           limit: 255
    t.string   "email",           limit: 255
    t.string   "idcard",          limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "remember_digest", limit: 255
  end

  add_index "users", ["email"], name: "email", unique: true, using: :btree

end
