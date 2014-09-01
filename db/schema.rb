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

ActiveRecord::Schema.define(version: 20140828220011) do

  create_table "authors", force: true do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "isbn10"
    t.string   "isbn13"
    t.integer  "author_id"
    t.string   "cover"
    t.boolean  "approved",   default: false
    t.float    "rating",     default: 0.0
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id"
  add_index "books", ["isbn10"], name: "index_books_on_isbn10"
  add_index "books", ["isbn13"], name: "index_books_on_isbn13"

  create_table "email_prefs", force: true do |t|
    t.integer  "user_id"
    t.boolean  "all_ratings"
    t.boolean  "all_reviews"
    t.boolean  "digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating",     default: 0
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
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
    t.boolean  "blocked",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
