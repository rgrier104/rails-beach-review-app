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

ActiveRecord::Schema.define(version: 2019_10_16_223048) do

  create_table "beaches", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "shore"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "beach_id", null: false
    t.integer "overall_rating"
    t.string "overall_description"
    t.integer "parking_rating"
    t.string "parking_description"
    t.integer "surfing_rating"
    t.string "surfing_description"
    t.boolean "swimming"
    t.boolean "snorkeling"
    t.boolean "paddleboarding"
    t.boolean "sunrise"
    t.boolean "sunset"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beach_id"], name: "index_reviews_on_beach_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reviews", "beaches"
  add_foreign_key "reviews", "users"
end
