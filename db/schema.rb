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

ActiveRecord::Schema.define(version: 20141030140546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", unique: true, using: :btree

  create_table "artworks", force: true do |t|
    t.string   "image",                           null: false
    t.integer  "uploader_id"
    t.integer  "artist_id"
    t.string   "title",       default: "Unknown"
    t.string   "art_type",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artworks", ["art_type"], name: "index_artworks_on_art_type", using: :btree
  add_index "artworks", ["artist_id"], name: "index_artworks_on_artist_id", using: :btree
  add_index "artworks", ["uploader_id"], name: "index_artworks_on_uploader_id", using: :btree

  create_table "stacks", force: true do |t|
    t.integer  "artwork_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stacks", ["artwork_id"], name: "index_stacks_on_artwork_id", using: :btree
  add_index "stacks", ["user_id"], name: "index_stacks_on_user_id", using: :btree

  create_table "user_profiles", force: true do |t|
    t.text     "username"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "location"
    t.text     "bio"
    t.boolean  "is_artist"
    t.boolean  "is_art_professional"
    t.boolean  "is_collector"
    t.boolean  "is_art_lover"
    t.boolean  "is_curator"
    t.boolean  "is_art_writer"
    t.boolean  "is_student"
    t.text     "website"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["password_digest"], name: "index_users_on_password_digest", unique: true, using: :btree

end
