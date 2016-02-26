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

ActiveRecord::Schema.define(version: 20160226013228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_entries", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "author"
    t.string   "permalink"
    t.datetime "date_published"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "api_v1_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "api_v1_tokens", ["user_id"], name: "index_api_v1_tokens_on_user_id", using: :btree

  create_table "api_v1_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "img"
    t.string   "circulation_status", default: "circulating"
    t.datetime "release_date"
    t.integer  "publisher_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "series_id"
    t.string   "subscription_type", default: "none"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "volume_id"
  end

  add_index "subscriptions", ["user_id", "series_id"], name: "index_subscriptions_on_user_id_and_series_id", unique: true, using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer  "series_id"
    t.string   "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["series_id"], name: "index_tags_on_series_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "volumes", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "author_id"
    t.string   "title"
    t.text     "description"
    t.datetime "release_date"
    t.string   "img"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "volumes", ["series_id"], name: "index_volumes_on_series_id", using: :btree

  add_foreign_key "api_v1_tokens", "users"
  add_foreign_key "series", "publishers"
  add_foreign_key "subscriptions", "series"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "tags", "series"
  add_foreign_key "tokens", "users"
  add_foreign_key "volumes", "authors"
  add_foreign_key "volumes", "series"
end
