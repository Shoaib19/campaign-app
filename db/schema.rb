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

ActiveRecord::Schema.define(version: 20211109124427) do

  create_table "campaign_tabs", force: :cascade do |t|
    t.string   "title"
    t.string   "purpose"
    t.integer  "estimated_duration"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_campaign_tabs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "commented_on_type"
    t.integer  "commented_on_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "campaign_tab_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["campaign_tab_id"], name: "index_tags_on_campaign_tab_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "campaign_tab_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["campaign_tab_id"], name: "index_todos_on_campaign_tab_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "campaign_tab_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["campaign_tab_id"], name: "index_topics_on_campaign_tab_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "user_type"
    t.string   "status"
    t.string   "profession"
    t.string   "service"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
