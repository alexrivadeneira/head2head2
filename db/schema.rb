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

ActiveRecord::Schema.define(version: 20151003044711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "score",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "total",      default: 0
  end

  create_table "guesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rating_id"
    t.boolean  "outcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "concept_id"
    t.integer  "opinion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "explanation"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "average",         default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "rated",           default: false
  end

end
