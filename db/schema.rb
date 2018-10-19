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

ActiveRecord::Schema.define(version: 20181019151110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "campaign_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
  end

  create_table "campaign_updates", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id"
    t.datetime "discarded_at"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["campaign_id"], name: "index_campaign_updates_on_campaign_id"
    t.index ["discarded_at"], name: "index_campaign_updates_on_discarded_at"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "uri"
    t.text "about"
    t.integer "goal"
    t.text "faq"
    t.string "card_description"
    t.integer "mode", default: 0
    t.integer "status", default: 0
    t.integer "deadline"
    t.string "location"
    t.string "video"
    t.string "video_image"
    t.boolean "recommended"
    t.string "video_id"
    t.datetime "published_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.bigint "user_id"
    t.string "card_image_file_name"
    t.string "card_image_content_type"
    t.integer "card_image_file_size"
    t.datetime "card_image_updated_at"
    t.bigint "campaign_category_id"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["campaign_category_id"], name: "index_campaigns_on_campaign_category_id"
    t.index ["discarded_at"], name: "index_campaigns_on_discarded_at"
    t.index ["name"], name: "index_campaigns_on_name"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contributions", force: :cascade do |t|
    t.integer "amount"
    t.integer "gateway"
    t.boolean "anonymous"
    t.integer "state"
    t.jsonb "raw", default: {}
    t.string "ref_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "campaign_id"
    t.bigint "reward_id"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["campaign_id"], name: "index_contributions_on_campaign_id"
    t.index ["reward_id"], name: "index_contributions_on_reward_id"
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["campaign_id"], name: "index_faqs_on_campaign_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.integer "total_reward"
    t.integer "claimed_reward"
    t.datetime "shipping_date"
    t.boolean "limited"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["campaign_id"], name: "index_rewards_on_campaign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "image"
    t.string "provider"
    t.string "uid"
    t.string "address"
    t.string "country"
    t.string "contact_number"
    t.string "pan"
    t.string "city"
    t.text "about"
    t.string "facebook"
    t.string "twitter"
    t.boolean "admin"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaign_updates", "campaigns"
  add_foreign_key "campaigns", "campaign_categories"
  add_foreign_key "campaigns", "users"
  add_foreign_key "contributions", "campaigns"
  add_foreign_key "contributions", "rewards"
  add_foreign_key "contributions", "users"
  add_foreign_key "faqs", "campaigns"
  add_foreign_key "rewards", "campaigns"
end
