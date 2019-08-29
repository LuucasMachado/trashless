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

ActiveRecord::Schema.define(version: 2019_08_29_005101) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "collectors", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact"
    t.string "withdrawal"
    t.integer "cooperative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_collectors_on_cooperative_id"
  end

  create_table "cooperatives", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_cooperatives_on_email", unique: true
    t.index ["reset_password_token"], name: "index_cooperatives_on_reset_password_token", unique: true
  end

  create_table "garbage_men", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact"
    t.string "withdrawal"
    t.integer "cooperative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "status"
    t.index ["cooperative_id"], name: "index_garbage_men_on_cooperative_id"
  end

  create_table "removal_orders", force: :cascade do |t|
    t.decimal "weight"
    t.datetime "removal_date_start"
    t.datetime "removal_date_end"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "user_id"
    t.string "description"
    t.integer "garbage_man_id"
    t.index ["garbage_man_id"], name: "index_removal_orders_on_garbage_man_id"
    t.index ["user_id"], name: "index_removal_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
