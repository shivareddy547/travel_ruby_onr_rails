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

ActiveRecord::Schema.define(version: 20200124153831) do

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
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "activities", force: :cascade do |t|
    t.integer "attraction_id"
    t.string "name"
    t.string "short_name"
    t.text "description"
    t.text "short_description"
    t.string "video_url"
    t.string "operating_hours"
    t.datetime "opening_time"
    t.datetime "closing_time"
    t.string "location_name"
    t.text "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "extra_tips"
    t.boolean "is_free"
    t.boolean "morning_ok"
    t.boolean "afternoon_ok"
    t.boolean "evening_ok"
    t.boolean "midnight_ok"
    t.integer "adult_price"
    t.integer "senior_price"
    t.integer "child_price"
    t.string "city"
    t.string "phone_number"
    t.string "category_names"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_attachments", force: :cascade do |t|
    t.integer "activity_id"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_details", force: :cascade do |t|
    t.string "name"
    t.string "account_holder_name"
    t.string "account_number"
    t.string "ifsc"
    t.string "swft_bc"
    t.string "description"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_bank_details_on_hotel_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.datetime "check_in"
    t.datetime "check_out"
    t.bigint "user_id"
    t.bigint "hotel_id"
    t.bigint "room_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
    t.index ["room_type_id"], name: "index_bookings_on_room_type_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "incl_charges", default: false
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hotel_id"
    t.string "images"
    t.integer "price"
    t.index ["hotel_id"], name: "index_facilities_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "images"
    t.integer "far_from_mrt"
    t.integer "far_from_airport"
    t.integer "far_from_busstand"
    t.integer "star"
    t.string "no_of_rooms"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.time "check_in"
    t.time "check_out"
    t.string "terms_and_conditions"
    t.string "map_url"
    t.string "rating"
    t.boolean "is_coupon_exists", default: false
    t.string "coupon_value"
    t.string "coupon_description"
    t.string "fact_of_hotel"
    t.string "currency_code"
  end

  create_table "invites", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.date "applied_at"
    t.decimal "coupon_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "near_by_activities", force: :cascade do |t|
    t.string "name"
    t.string "images"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_near_by_activities_on_hotel_id"
  end

  create_table "near_by_restaurants", force: :cascade do |t|
    t.string "name"
    t.string "images"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_near_by_restaurants_on_hotel_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.string "status", default: "PENDING"
    t.string "price"
    t.string "integer"
    t.bigint "hotel_id"
    t.bigint "user_id"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_type"
    t.index ["booking_id"], name: "index_payment_details_on_booking_id"
    t.index ["hotel_id"], name: "index_payment_details_on_hotel_id"
    t.index ["user_id"], name: "index_payment_details_on_user_id"
  end

  create_table "restaurant_attachments", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer "restaurantid"
    t.string "name"
    t.string "short_name"
    t.text "description"
    t.text "short_description"
    t.string "video_url"
    t.string "operating_hours"
    t.datetime "opening_time"
    t.datetime "closing_time"
    t.string "location_name"
    t.text "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.boolean "breakfast"
    t.boolean "lunch"
    t.boolean "dinner"
    t.boolean "coffee"
    t.string "city"
    t.string "phone_number"
    t.string "category_names"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "include_breakfast", default: false
    t.boolean "is_active", default: true
    t.integer "room_size"
    t.integer "bathroom_size"
    t.integer "bed_size"
    t.integer "no_of_adult"
    t.integer "no_of_child"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "infant_age_limit"
    t.integer "capacity"
    t.integer "availability_units"
    t.index ["hotel_id"], name: "index_room_types_on_hotel_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.bigint "hotel_id"
    t.string "coupon_code"
    t.decimal "wallet_amount", default: "0.0"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hotel_id"], name: "index_users_on_hotel_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  create_table "wallet_histories", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "previous_amount", default: "0.0"
    t.decimal "current_amount", default: "0.0"
    t.integer "transaction_type"
    t.date "transaction_date"
    t.string "transaction_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bank_details", "hotels"
  add_foreign_key "bookings", "hotels"
  add_foreign_key "bookings", "room_types"
  add_foreign_key "bookings", "users"
  add_foreign_key "facilities", "hotels"
  add_foreign_key "near_by_activities", "hotels"
  add_foreign_key "near_by_restaurants", "hotels"
  add_foreign_key "payment_details", "bookings"
  add_foreign_key "payment_details", "hotels"
  add_foreign_key "payment_details", "users"
  add_foreign_key "room_types", "hotels"
  add_foreign_key "users", "hotels"
  add_foreign_key "users", "teams"
end
