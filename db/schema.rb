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

ActiveRecord::Schema.define(version: 2022_09_06_234014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "aircrafts", force: :cascade do |t|
    t.string "tail_number"
    t.integer "first_class_capacity"
    t.integer "business_class_capacity"
    t.integer "economy_class_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "iata_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.index ["state_id"], name: "index_airports_on_state_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "booking_reference"
    t.decimal "booking_fee"
    t.string "passenger_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "flight_id"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "currency"
    t.string "country_code"
    t.string "exchange_rate"
    t.string "iso_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "departure_date"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "aircraft_id"
    t.bigint "airport_id"
    t.integer "available_seats"
    t.integer "origin_id"
    t.integer "destination_id"
    t.index ["aircraft_id"], name: "index_flights_on_aircraft_id"
    t.index ["airport_id"], name: "index_flights_on_airport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.integer "age"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "payment_date"
    t.string "transaction_ref"
    t.string "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone_number"
    t.string "password_digest"
    t.string "confirm_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "airports", "states"
  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings", "users", column: "users_id"
  add_foreign_key "flights", "aircrafts"
  add_foreign_key "flights", "airports"
  add_foreign_key "flights", "airports", column: "destination_id"
  add_foreign_key "flights", "airports", column: "origin_id"
  add_foreign_key "passengers", "bookings"
  add_foreign_key "payments", "bookings"
end
