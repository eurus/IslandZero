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

ActiveRecord::Schema.define(version: 20150110143326) do

  create_table "messages", force: true do |t|
    t.integer  "chattable_id"
    t.string   "chattable_type"
    t.text     "content",        null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["chattable_id", "chattable_type"], name: "index_messages_on_chattable_id_and_chattable_type"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "posts", force: true do |t|
    t.integer  "topic_id",               null: false
    t.integer  "user_id",                null: false
    t.integer  "parent_id",  default: 0, null: false
    t.string   "title"
    t.text     "content",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "topic_users", force: true do |t|
    t.integer  "topic_id",                   null: false
    t.integer  "user_id",                    null: false
    t.boolean  "is_starred", default: false, null: false
    t.datetime "visited_at"
  end

  add_index "topic_users", ["topic_id", "user_id"], name: "index_topic_users_on_topic_id_and_user_id", unique: true

  create_table "topics", force: true do |t|
    t.integer  "parent_id",         default: 0,   null: false
    t.string   "title",                           null: false
    t.text     "introduction",                    null: false
    t.integer  "rank",              default: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "all_sub_topic_ids"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "nickname",                               null: false
    t.boolean  "is_admin",               default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
