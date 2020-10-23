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

ActiveRecord::Schema.define(version: 2020_10_23_062720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "state"
    t.string "gender"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "contact_number"
    t.string "postal_code"
    t.integer "social_security_number"
    t.integer "license_number"
    t.string "token_expires_at"
    t.string "base_time"
    t.decimal "base_price"
    t.string "profile_description"
    t.string "profile_title"
    t.string "profile_image"
    t.string "address"
    t.datetime "dob"
    t.string "street"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_id"
    t.index ["email"], name: "index_athletes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_athletes_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_athletes_on_school_id"
  end

  create_table "booking_requests", force: :cascade do |t|
    t.string "status", default: "In Cart"
    t.bigint "client_id"
    t.bigint "provided_service_id"
    t.string "note"
    t.datetime "booking_date"
    t.boolean "completed_by_client", default: false
    t.boolean "completed_by_athlete", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entry_id"
    t.index ["client_id"], name: "index_booking_requests_on_client_id"
    t.index ["entry_id"], name: "index_booking_requests_on_entry_id"
    t.index ["provided_service_id"], name: "index_booking_requests_on_provided_service_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "status", default: "InComplete"
    t.bigint "client_id"
    t.bigint "provided_service_id"
    t.string "note"
    t.datetime "booking_date"
    t.boolean "completed_by_client", default: false
    t.boolean "completed_by_athlete", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entry_id"
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["entry_id"], name: "index_bookings_on_entry_id"
    t.index ["provided_service_id"], name: "index_bookings_on_provided_service_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "city"
    t.string "state"
    t.string "gender"
    t.string "contact_number"
    t.string "postal_code"
    t.datetime "dob"
    t.string "address"
    t.string "street"
    t.string "profile_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entries", force: :cascade do |t|
    t.datetime "booking_date"
    t.datetime "from_time"
    t.datetime "to_time"
    t.datetime "from_date"
    t.datetime "to_date"
    t.bigint "athlete_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["athlete_id"], name: "index_entries_on_athlete_id"
  end

  create_table "provided_services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.string "duration"
    t.string "location"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "athlete_id"
    t.bigint "service_id"
    t.index ["athlete_id"], name: "index_provided_services_on_athlete_id"
    t.index ["service_id"], name: "index_provided_services_on_service_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "school_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "sport_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "athletes", "schools"
  add_foreign_key "booking_requests", "clients"
  add_foreign_key "booking_requests", "entries"
  add_foreign_key "booking_requests", "provided_services"
  add_foreign_key "bookings", "clients"
  add_foreign_key "bookings", "entries"
  add_foreign_key "bookings", "provided_services"
  add_foreign_key "entries", "athletes"
  add_foreign_key "provided_services", "athletes"
  add_foreign_key "provided_services", "services"
end
