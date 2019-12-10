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

ActiveRecord::Schema.define(version: 2019_12_10_075319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "donations", force: :cascade do |t|
    t.boolean "confirmed", default: false
    t.bigint "user_id"
    t.bigint "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed?", default: false
    t.index ["food_id"], name: "index_donations_on_food_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string "full_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_number"
    t.index ["user_id"], name: "index_donors_on_user_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.bigint "food_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_food_categories_on_category_id"
    t.index ["food_id"], name: "index_food_categories_on_food_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "purchase_date"
    t.bigint "donor_id"
    t.string "location"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["donor_id"], name: "index_foods_on_donor_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "donation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.bigint "receiving_user_id"
    t.index ["donation_id"], name: "index_messages_on_donation_id"
    t.index ["receiving_user_id"], name: "index_messages_on_receiving_user_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.bigint "donation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
    t.bigint "reviewed_user_id"
    t.index ["donation_id"], name: "index_reviews_on_donation_id"
    t.index ["reviewed_user_id"], name: "index_reviews_on_reviewed_user_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "username"
    t.time "preferred_start_time"
    t.time "preferred_end_time"
    t.string "bio"
    t.text "pickup_days"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "donations", "foods"
  add_foreign_key "donations", "users"
  add_foreign_key "donors", "users"
  add_foreign_key "food_categories", "categories"
  add_foreign_key "food_categories", "foods"
  add_foreign_key "foods", "donors"
  add_foreign_key "messages", "donations"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "users", column: "receiving_user_id"
  add_foreign_key "reviews", "donations"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "users", column: "reviewed_user_id"
end
