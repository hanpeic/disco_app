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

ActiveRecord::Schema.define(version: 20151017185711) do

  create_table "plans", force: :cascade do |t|
    t.integer  "status",              default: 0
    t.string   "default_name",                       null: false
    t.integer  "default_charge_type", default: 0
    t.decimal  "default_price",       default: 9.99
    t.integer  "default_trial_days",  default: 14
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain",                         null: false
    t.string   "shopify_token",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                     default: 0
    t.string   "email"
    t.string   "country_name"
    t.string   "currency"
    t.string   "money_format"
    t.string   "money_with_currency_format"
    t.string   "domain"
    t.string   "plan_name"
    t.integer  "charge_status",              default: 6
    t.string   "plan_display_name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "customer_email"
    t.boolean  "password_enabled"
    t.string   "phone"
    t.string   "primary_locale"
    t.string   "ships_to_countries"
    t.string   "timezone"
    t.string   "iana_timezone"
    t.boolean  "has_storefront"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "shop_id"
    t.integer  "plan_id"
    t.integer  "status",      default: 0
    t.string   "name",                    null: false
    t.integer  "charge_type", default: 0
    t.decimal  "price",                   null: false
    t.integer  "trial_days",              null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "subscriptions", ["plan_id"], name: "index_subscriptions_on_plan_id"
  add_index "subscriptions", ["shop_id"], name: "index_subscriptions_on_shop_id"

end
