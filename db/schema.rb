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

ActiveRecord::Schema.define(version: 20151015141406) do

  create_table "polls", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "polls", ["author_id"], name: "index_polls_on_author_id"
  add_index "polls", ["title"], name: "index_polls_on_title"

  create_table "questions", force: :cascade do |t|
    t.integer  "poll_id"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["poll_id"], name: "index_questions_on_poll_id"
  add_index "questions", ["question"], name: "index_questions_on_question"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
