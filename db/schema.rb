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

ActiveRecord::Schema.define(version: 20180826040605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_images", force: :cascade do |t|
    t.string "campaign_image_file_name"
    t.string "campaign_image_content_type"
    t.integer "campaign_image_file_size"
    t.datetime "campaign_image_updated_at"
    t.bigint "campaigns_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaigns_id"], name: "index_campaign_images_on_campaigns_id"
  end

  create_table "campaign_updates", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_campaign_updates_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "uri"
    t.text "about"
    t.text "faq"
    t.string "card_description"
    t.string "category"
    t.integer "mode", default: 1
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.string "location"
    t.bigint "user_id"
    t.string "video"
    t.string "video_image"
    t.integer "deadline"
    t.integer "goal"
    t.string "card_image_file_name"
    t.string "card_image_content_type"
    t.integer "card_image_file_size"
    t.datetime "card_image_updated_at"
    t.index ["discarded_at"], name: "index_campaigns_on_discarded_at"
    t.index ["name"], name: "index_campaigns_on_name"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.text "description"
    t.integer "total_reward"
    t.integer "claimed_reward"
    t.datetime "shipping_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id"
    t.boolean "limited"
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
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "address"
    t.string "country"
    t.string "contact_number"
    t.string "pan"
    t.string "city"
    t.text "about"
    t.string "facebook"
    t.string "twitter"
    t.boolean "admin"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaign_images", "campaigns", column: "campaigns_id"
  add_foreign_key "campaign_updates", "campaigns"
  add_foreign_key "campaigns", "users"
  add_foreign_key "rewards", "campaigns"
end
