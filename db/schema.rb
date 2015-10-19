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

ActiveRecord::Schema.define(version: 20151016194036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "investment_transactions", force: :cascade do |t|
    t.integer  "amount"
    t.string   "transaction_desc"
    t.date     "transaction_date"
    t.string   "investment_desc"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "investment_id"
  end

  create_table "investments", id: false, force: :cascade do |t|
    t.string   "investment_desc", null: false
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "investments", ["investment_desc"], name: "index_investments_on_investment_desc", unique: true, using: :btree

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "investment_transactions", "investments", column: "investment_desc", primary_key: "investment_desc"
end
