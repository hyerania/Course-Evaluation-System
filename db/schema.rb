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

ActiveRecord::Schema.define(version: 20180324202143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.integer "eid"
    t.string "title"
    t.string "content", default: [], array: true
  end

  create_table "questions", force: :cascade do |t|
    t.integer "qid"
    t.string "content"
    t.string "qtype"
    t.string "answer"
    t.string "c1"
    t.string "c2"
    t.string "c3"
    t.string "c4"
    t.string "c5"
    t.string "parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qid"], name: "index_questions_on_qid"
  end

  create_table "students", force: :cascade do |t|
    t.integer "uin"
    t.string "name"
    t.integer "section"
    t.integer "attempts"
    t.integer "score"
    t.datetime "last_start"
    t.datetime "last_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uin"], name: "index_students_on_uin"
  end

end
