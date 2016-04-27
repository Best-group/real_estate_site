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

ActiveRecord::Schema.define(version: 20160427032700) do

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "userID",     null: false
    t.integer  "listingID",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "listingID",                  null: false
    t.integer  "order",                      null: false
    t.string   "image_link",     limit: 100, null: false
    t.string   "thumbnail_link", limit: 100, null: false
    t.string   "caption",        limit: 30
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "linked_suburbs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "suburbID",    null: false
    t.integer  "to_suburbID", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "listing_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "property_type", limit: 25, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "listings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "listingID"
    t.string   "title"
    t.integer  "duration"
    t.integer  "suburbID"
    t.string   "street"
    t.string   "unit"
    t.float    "price",       limit: 24
    t.integer  "bedroom"
    t.integer  "bathroom"
    t.integer  "carports"
    t.float    "land_size",   limit: 24
    t.string   "description"
    t.string   "typeID"
    t.integer  "views"
    t.boolean  "sold"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "subscription_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",            limit: 25, default: "",    null: false
    t.integer  "months_duration",                            null: false
    t.float    "value",           limit: 24,                 null: false
    t.integer  "max_listings",                               null: false
    t.integer  "max_images",                                 null: false
    t.boolean  "private_options",            default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "userID",       null: false
    t.integer  "type",         null: false
    t.datetime "date_started", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "suburbs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "state",      limit: 3,  null: false
    t.integer  "postcode",              null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "phone"
    t.datetime "DOB"
    t.string   "register_date"
    t.boolean  "show_name"
    t.boolean  "show_email"
    t.boolean  "show_phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "listings", "users"
end
