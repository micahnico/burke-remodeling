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

ActiveRecord::Schema.define(version: 20170202135845) do

  create_table "cities", force: :cascade do |t|
    t.string   "wiki_link"
    t.text     "wiki_text"
    t.string   "city_name"
    t.string   "state"
    t.decimal  "population"
    t.string   "city_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "salon_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "notes", ["salon_id"], name: "index_notes_on_salon_id"

  create_table "sales_actions", force: :cascade do |t|
    t.boolean  "completed",        default: false, null: false
    t.decimal  "duration"
    t.datetime "ended_at"
    t.integer  "user_id"
    t.integer  "salon_id"
    t.integer  "sales_session_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "sales_actions", ["sales_session_id"], name: "index_sales_actions_on_sales_session_id"
  add_index "sales_actions", ["salon_id"], name: "index_sales_actions_on_salon_id"
  add_index "sales_actions", ["user_id"], name: "index_sales_actions_on_user_id"

  create_table "sales_sessions", force: :cascade do |t|
    t.datetime "ended_at"
    t.boolean  "active",            default: false, null: false
    t.decimal  "duration"
    t.integer  "number_of_actions"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "walking",           default: false, null: false
    t.string   "start_location"
  end

  add_index "sales_sessions", ["user_id"], name: "index_sales_sessions_on_user_id"

  create_table "salons", force: :cascade do |t|
    t.string   "business_name"
    t.string   "email"
    t.string   "phone"
    t.string   "stage"
    t.integer  "zip_code_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "mobile_ready",           default: false, null: false
    t.boolean  "appointment_scheduling", default: false, null: false
    t.string   "contact"
    t.boolean  "website",                default: false, null: false
    t.string   "web_address"
    t.string   "street_address"
    t.integer  "user_id"
    t.string   "time_zone"
    t.boolean  "prospect_stage",         default: false, null: false
    t.boolean  "contact_stage",          default: false, null: false
    t.boolean  "demo_stage",             default: false, null: false
    t.boolean  "closed_no_stage",        default: false, null: false
    t.boolean  "closed_yes_stage",       default: false, null: false
    t.boolean  "called",                 default: false, null: false
    t.boolean  "spoke_to_human",         default: false, null: false
    t.boolean  "owner_name",             default: false, null: false
    t.boolean  "one_decision_maker",     default: false, null: false
    t.boolean  "price_discussed",        default: false, null: false
    t.boolean  "next_action_agreed",     default: false, null: false
    t.boolean  "rep_asked_questions",    default: false, null: false
    t.boolean  "owner_asked_questions",  default: false, null: false
    t.boolean  "deadline_discussed",     default: false, null: false
    t.boolean  "too_much",               default: false, null: false
    t.boolean  "competition",            default: false, null: false
    t.boolean  "missing_features",       default: false, null: false
    t.boolean  "paperwork",              default: false, null: false
    t.boolean  "paid",                   default: false, null: false
    t.boolean  "implemented",            default: false, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "details"
    t.boolean  "text_alert"
    t.datetime "due_at"
    t.datetime "completed_at"
    t.boolean  "completed"
    t.integer  "salon_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tasks", ["salon_id"], name: "index_tasks_on_salon_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.boolean  "agent"
    t.boolean  "salon_owner"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "zip_codes", force: :cascade do |t|
    t.integer  "zip"
    t.integer  "city_id"
    t.boolean  "active_client"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
