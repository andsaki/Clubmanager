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

ActiveRecord::Schema.define(version: 20170914102115) do

  create_table "attendances", force: :cascade do |t|
    t.string "e_id"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "about"
    t.string "year"
    t.string "month"
    t.string "date"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "master_id"
    t.string "master_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "about"
  end

  create_table "members", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "p"
  end

  create_table "messages", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "recruits", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "name"
    t.boolean "administrator", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", default: "", null: false
    t.integer "age"
    t.text "sex", default: ""
    t.string "location", default: ""
    t.text "comment", default: ""
    t.string "image"
    t.integer "month"
    t.integer "day"
    t.integer "state_group_id", default: -1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
