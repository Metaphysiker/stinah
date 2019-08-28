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

ActiveRecord::Schema.define(version: 2019_08_28_053737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "species"
    t.string "race"
    t.date "birth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "home_offers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "street"
    t.string "plz"
    t.string "city"
    t.string "phone"
    t.string "email"
    t.string "year"
    t.text "experience"
    t.text "motivation"
    t.text "plans"
    t.string "species"
    t.string "race"
    t.string "age"
    t.string "size"
    t.string "gender"
    t.string "castrated"
    t.string "stable"
    t.text "stable_alt"
    t.boolean "privacy_statement"
    t.date "from_then_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "home_requests", force: :cascade do |t|
    t.boolean "are_you_owner"
    t.string "owner_firstname"
    t.string "owner_lastname"
    t.string "owner_street"
    t.string "owner_plz"
    t.string "owner_city"
    t.string "owner_phone"
    t.string "owner_email"
    t.boolean "does_owner_agree_with_mediation"
    t.boolean "do_you_own_authority_of_mediation"
    t.string "messenger_firstname"
    t.string "messenger_lastname"
    t.string "messenger_street"
    t.string "messenger_plz"
    t.string "messenger_city"
    t.string "messenger_phone"
    t.string "messenger_mail"
    t.boolean "killing_of_animal_intended"
    t.boolean "killing_of_animal_scheduled"
    t.date "date_of_killing"
    t.string "species"
    t.string "race"
    t.string "age"
    t.string "size"
    t.string "color"
    t.string "gender"
    t.string "castrated"
    t.string "current_location"
    t.text "features"
    t.string "stable_owner_firstname"
    t.string "stable_owner_lastname"
    t.string "stable_street"
    t.string "stable_plz"
    t.string "stable_city"
    t.string "stable_phone"
    t.text "how_was_animal_held"
    t.text "how_was_animal_used"
    t.text "reason_of_request"
    t.text "is_animal_healthy"
    t.boolean "privacy_statement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role", default: "sponsor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sponsorships", force: :cascade do |t|
    t.bigint "animal_id"
    t.bigint "user_id"
    t.boolean "public", default: false
    t.decimal "donation", precision: 10, scale: 2
    t.index ["animal_id"], name: "index_sponsorships_on_animal_id"
    t.index ["user_id"], name: "index_sponsorships_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "firstname", default: ""
    t.string "lastname", default: ""
    t.string "street", default: ""
    t.string "city", default: ""
    t.string "plz", default: ""
    t.string "phone", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "posts", "users"
end
