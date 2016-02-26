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

ActiveRecord::Schema.define(version: 20160226015952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "author"
    t.string   "permalink"
    t.datetime "date_published"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "entries_users", id: false, force: :cascade do |t|
    t.integer "entry_id"
    t.integer "user_id"
  end

  add_index "entries_users", ["entry_id", "user_id"], name: "index_entries_users_on_entry_id_and_user_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.string   "contents"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tokens", "users"
end
