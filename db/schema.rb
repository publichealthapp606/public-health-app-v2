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

ActiveRecord::Schema[7.0].define(version: 2024_05_23_072518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 2
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "surveys_id", null: false
    t.bigint "low_score", null: false
    t.bigint "high_score", null: false
    t.text "category", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surveys_id"], name: "index_categories_on_surveys_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "local_resource_id", null: false
    t.boolean "receiving_support"
    t.boolean "contacted_local_resources"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["local_resource_id"], name: "index_feedbacks_on_local_resource_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "local_resources", force: :cascade do |t|
    t.text "zip", null: false
    t.text "name", null: false
    t.text "website"
    t.text "address"
    t.text "phone_number"
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.boolean "is_partner"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.text "language", null: false
    t.text "question_text", null: false
    t.text "options_list", null: false, array: true
    t.integer "option_points_list", null: false, array: true
    t.text "question_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "child"
    t.text "option_selected_to_display_child"
    t.string "parent_question_number"
    t.index ["survey_id", "language"], name: "index_questions_on_survey_id_and_language"
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "user_id", null: false
    t.text "question_number"
    t.integer "response_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "response_option_number"
    t.datetime "time_submitted"
    t.index ["survey_id"], name: "index_responses_on_survey_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "search_items", force: :cascade do |t|
    t.string "category"
    t.string "phrase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_results", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "users_id", null: false
    t.integer "total_score", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_submitted", null: false
    t.bigint "categories_id", null: false
    t.index ["categories_id"], name: "index_survey_results_on_categories_id"
    t.index ["survey_id", "users_id"], name: "index_survey_results_on_survey_id_and_users_id"
    t.index ["survey_id"], name: "index_survey_results_on_survey_id"
    t.index ["users_id"], name: "index_survey_results_on_users_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.text "survey_name", default: "", null: false
    t.text "survey_category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "languages", null: false, array: true
    t.index ["survey_name"], name: "index_surveys_on_survey_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "email", default: "", null: false
    t.text "encrypted_password", default: "", null: false
    t.text "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.text "address_line_1", null: false
    t.text "address_line_2"
    t.text "city", null: false
    t.text "state", null: false
    t.text "zip", null: false
    t.text "phone_number", null: false
    t.date "date_of_birth", null: false
    t.text "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text "unconfirmed_email"
    t.string "gender"
    t.integer "physician_id"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "agreed_to_terms_of_use"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "surveys", column: "surveys_id"
  add_foreign_key "feedbacks", "local_resources"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "questions", "surveys"
  add_foreign_key "responses", "surveys"
  add_foreign_key "responses", "users"
  add_foreign_key "survey_results", "surveys"
  add_foreign_key "survey_results", "users", column: "users_id"
end
