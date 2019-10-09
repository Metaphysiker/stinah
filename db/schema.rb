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

ActiveRecord::Schema.define(version: 2019_10_09_075400) do

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

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "species"
    t.string "race"
    t.date "birth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
    t.integer "size"
    t.string "birth_ca", default: ""
    t.text "search_field", default: ""
    t.string "health_status", default: "healthy"
    t.string "slug"
    t.index ["slug"], name: "index_animals_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "home_offers", force: :cascade do |t|
    t.string "species"
    t.string "race"
    t.string "gender"
    t.string "castrated"
    t.string "stable"
    t.text "stable_alt"
    t.date "from_then_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "rideable"
    t.integer "min_age"
    t.integer "max_age"
    t.integer "min_size"
    t.integer "max_size"
    t.boolean "archived", default: false
    t.text "search_field", default: ""
    t.boolean "age", default: true
    t.boolean "size", default: true
    t.bigint "offerer_id"
    t.index ["offerer_id"], name: "index_home_offers_on_offerer_id"
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
    t.integer "age"
    t.integer "size"
    t.string "color"
    t.string "gender"
    t.string "castrated"
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
    t.boolean "rideable"
    t.boolean "archived", default: false
    t.text "search_field", default: ""
  end

  create_table "offerers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "street"
    t.string "city"
    t.string "plz"
    t.string "phone"
    t.string "email"
    t.string "year"
    t.text "experience"
    t.text "motivation"
    t.text "plans"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "search_field", default: ""
    t.boolean "privacy_statement"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "video_src", default: ""
    t.string "slug"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
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
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.boolean "active", default: false
    t.date "last_check_of_payment"
    t.index ["animal_id"], name: "index_sponsorships_on_animal_id"
    t.index ["user_id"], name: "index_sponsorships_on_user_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.string "firstname", default: ""
    t.string "lastname", default: ""
    t.text "description", default: ""
    t.string "phone", default: ""
    t.string "email", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.datetime "shift_start"
    t.datetime "shift_end"
    t.string "food"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "posts", "users"
end
