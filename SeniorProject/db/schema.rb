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

ActiveRecord::Schema[7.1].define(version: 2024_03_18_154831) do
  create_table "awards", force: :cascade do |t|
    t.string "aname"
    t.string "string"
    t.string "description"
    t.date "awardeddate"
    t.integer "User_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["User_id"], name: "index_awards_on_User_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "schoolname"
    t.date "sdate"
    t.date "edate"
    t.string "educationlevel"
    t.integer "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["users_id"], name: "index_degrees_on_users_id"
  end

  create_table "majors", force: :cascade do |t|
    t.string "majname"
    t.string "status"
    t.integer "degree_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_majors_on_degree_id"
  end

  create_table "minors", force: :cascade do |t|
    t.string "minname"
    t.string "status"
    t.integer "degree_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_minors_on_degree_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fnames"
    t.text "lname"
    t.string "prename"
    t.string "username"
    t.string "passcode"
    t.string "email"
    t.string "phonenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  add_foreign_key "awards", "Users"
  add_foreign_key "degrees", "users", column: "users_id"
  add_foreign_key "majors", "degrees"
  add_foreign_key "minors", "degrees"
end
