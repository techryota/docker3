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

ActiveRecord::Schema.define(version: 2019_11_23_012029) do

  create_table "counts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "ball1"
    t.integer "ball2"
    t.integer "ball3"
    t.integer "ball4"
    t.integer "strike1"
    t.integer "strike2"
    t.integer "strike3"
    t.integer "auto1"
    t.integer "auto2"
    t.integer "auto3"
    t.string "report"
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_counts_on_group_id"
    t.index ["user_id"], name: "index_counts_on_user_id"
  end

  create_table "good_evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "good"
    t.bigint "user_id"
    t.bigint "evaluate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluate_id"], name: "index_good_evaluations_on_evaluate_id"
    t.index ["user_id"], name: "index_good_evaluations_on_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.date "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.string "image"
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "scores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "first1"
    t.integer "second1"
    t.integer "first2"
    t.integer "second2"
    t.integer "first3"
    t.integer "second3"
    t.integer "first4"
    t.integer "second4"
    t.integer "first5"
    t.integer "second5"
    t.integer "first6"
    t.integer "second6"
    t.integer "first7"
    t.integer "second7"
    t.integer "first8"
    t.integer "second8"
    t.integer "first9"
    t.integer "second9"
    t.integer "first10"
    t.integer "second10"
    t.integer "first11"
    t.integer "second11"
    t.integer "first12"
    t.integer "second12"
    t.integer "first_hit"
    t.integer "second_hit"
    t.integer "first_error"
    t.integer "second_error"
    t.string "first_team"
    t.string "second_team"
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_scores_on_group_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "image"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "counts", "groups"
  add_foreign_key "counts", "users"
  add_foreign_key "good_evaluations", "users"
  add_foreign_key "good_evaluations", "users", column: "evaluate_id"
  add_foreign_key "groups", "users"
  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users"
  add_foreign_key "scores", "groups"
  add_foreign_key "scores", "users"
end
