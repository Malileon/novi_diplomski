# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_18_113453) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choice_questions", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.string "question_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "quiz_id"], name: "index_choice_questions_on_id_and_quiz_id", unique: true
    t.index ["quiz_id"], name: "index_choice_questions_on_quiz_id"
    t.check_constraint "id <> quiz_id", name: "choice_question_id_not_quiz_id"
    t.unique_constraint ["id"], name: "unique_choice_question_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "choice_question_id", null: false
    t.string "value", null: false
    t.integer "is_correct", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_question_id"], name: "index_choices_on_choice_question_id"
  end

  create_table "quiz_sessions", force: :cascade do |t|
    t.string "quiz_id"
    t.bigint "user_id"
    t.string "user_type", null: false
    t.string "guest_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "points", precision: 10, scale: 2, null: false
    t.index ["user_id"], name: "index_quiz_sessions_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_quizzes_on_topic_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "text_input_questions", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.string "question_text", null: false
    t.string "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "quiz_id"], name: "index_text_input_questions_on_id_and_quiz_id", unique: true
    t.index ["quiz_id"], name: "index_text_input_questions_on_quiz_id"
    t.check_constraint "id <> quiz_id", name: "text_input_question_id_not_quiz_id"
    t.unique_constraint ["id"], name: "unique_text_input_question_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "is_admin", default: 0, null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "choice_questions", "quizzes"
  add_foreign_key "choices", "choice_questions"
  add_foreign_key "quiz_sessions", "users"
  add_foreign_key "quizzes", "topics"
  add_foreign_key "quizzes", "users"
  add_foreign_key "text_input_questions", "quizzes"
end
