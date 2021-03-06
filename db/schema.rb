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

ActiveRecord::Schema.define(version: 20140119145627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.integer  "runner_id"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posts", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "intranets", force: true do |t|
    t.text     "category_name"
    t.boolean  "show"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "finish_time"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "excerpt"
    t.text     "body"
    t.date     "publish_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relateds", force: true do |t|
    t.text     "weburl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runners", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "age"
    t.string   "gender"
  end

  create_table "runners_shoes", force: true do |t|
    t.integer "runner_id"
    t.integer "shoe_id"
  end

  create_table "shoes", force: true do |t|
    t.string   "make"
    t.string   "size"
    t.string   "shoe_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sliders", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slides", force: true do |t|
    t.integer  "slider_id"
    t.text     "description"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_slide_file_name"
    t.string   "image_slide_content_type"
    t.integer  "image_slide_file_size"
    t.datetime "image_slide_updated_at"
    t.integer  "sort"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
