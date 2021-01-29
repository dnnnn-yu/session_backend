# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_29_125932) do

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "post_id", null: false
    t.index ["member_id", "post_id"], name: "index_favorites_on_member_id_and_post_id", unique: true
    t.index ["member_id"], name: "index_favorites_on_member_id"
    t.index ["post_id"], name: "index_favorites_on_post_id"
  end

  create_table "member_parts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "part_id", null: false
    t.index ["member_id", "part_id"], name: "index_member_parts_on_member_id_and_part_id", unique: true
    t.index ["member_id"], name: "index_member_parts_on_member_id"
    t.index ["part_id"], name: "index_member_parts_on_part_id"
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.column "gender", "enum('male','female')"
    t.string "image"
    t.date "birthday"
    t.text "profile"
    t.bigint "prefecture_id"
    t.string "portfolio_url"
    t.string "twitter_id"
    t.string "instagram_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birthday"], name: "index_members_on_birthday"
    t.index ["gender"], name: "index_members_on_gender"
    t.index ["prefecture_id"], name: "index_members_on_prefecture_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "send_member_id", null: false
    t.bigint "recieve_member_id", null: false
    t.text "content"
    t.index ["recieve_member_id"], name: "index_messages_on_recieve_member_id"
    t.index ["send_member_id"], name: "index_messages_on_send_member_id"
  end

  create_table "parts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.integer "show_order", null: false
    t.index ["name"], name: "index_parts_on_name", unique: true
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "type"
    t.string "title"
    t.text "content"
    t.bigint "part_id"
    t.integer "age_min"
    t.integer "age_max"
    t.bigint "prefecture_id", null: false
    t.column "gender", "enum('male','female')"
    t.string "portfolio_url"
    t.date "work_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["age_max"], name: "index_posts_on_age_max"
    t.index ["age_min"], name: "index_posts_on_age_min"
    t.index ["gender"], name: "index_posts_on_gender"
    t.index ["member_id"], name: "index_posts_on_member_id"
    t.index ["part_id"], name: "index_posts_on_part_id"
    t.index ["prefecture_id"], name: "index_posts_on_prefecture_id"
    t.index ["work_on"], name: "index_posts_on_work_on"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "area_id", null: false
    t.index ["area_id"], name: "index_prefectures_on_area_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "favorites", "members"
  add_foreign_key "favorites", "posts"
  add_foreign_key "member_parts", "members"
  add_foreign_key "member_parts", "parts"
  add_foreign_key "members", "prefectures"
  add_foreign_key "members", "users"
  add_foreign_key "messages", "members", column: "recieve_member_id"
  add_foreign_key "messages", "members", column: "send_member_id"
  add_foreign_key "posts", "members"
  add_foreign_key "posts", "parts"
  add_foreign_key "posts", "prefectures"
  add_foreign_key "prefectures", "areas"
end
