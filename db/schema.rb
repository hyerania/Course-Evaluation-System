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

ActiveRecord::Schema.define(version: 20181105023751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_keys", force: :cascade do |t|
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "eid"
    t.string "title"
    t.string "content", default: [], array: true
    t.string "access_code"
    t.integer "scales", default: [], array: true
    t.integer "qids", default: [], array: true
    t.bigint "questions_id"
    t.index ["questions_id"], name: "index_evaluations_on_questions_id"
  end

  create_table "instructions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privilages", force: :cascade do |t|
    t.string "actionnames"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_tags", force: :cascade do |t|
    t.string "tagname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "c1_count"
    t.integer "c2_count"
    t.integer "c3_count"
    t.integer "c4_count"
    t.integer "c5_count"
    t.integer "numAnswers", null: false
    t.bigint "question_tags_id"
    t.index ["qid"], name: "index_questions_on_qid"
    t.index ["question_tags_id"], name: "index_questions_on_question_tags_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "rolename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "privilages_id"
    t.index ["privilages_id"], name: "index_roles_on_privilages_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "students_id"
    t.bigint "evaluations_id"
    t.index ["evaluations_id"], name: "index_scores_on_evaluations_id"
    t.index ["students_id"], name: "index_scores_on_students_id"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "section_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "students_id"
    t.index ["students_id"], name: "index_sections_on_students_id"
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
    t.integer "choices", default: [], array: true
    t.integer "scoretotal", default: 0
    t.index ["uin"], name: "index_students_on_uin"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "roles_id"
    t.index ["roles_id"], name: "index_users_on_roles_id"
  end

  add_foreign_key "evaluations", "questions", column: "questions_id"
  add_foreign_key "questions", "question_tags", column: "question_tags_id"
  add_foreign_key "roles", "privilages", column: "privilages_id"
  add_foreign_key "scores", "evaluations", column: "evaluations_id"
  add_foreign_key "scores", "students", column: "students_id"
  add_foreign_key "sections", "students", column: "students_id"
  add_foreign_key "users", "roles", column: "roles_id"
end
