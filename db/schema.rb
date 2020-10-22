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

ActiveRecord::Schema.define(version: 2020_10_20_094056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debtors", force: :cascade do |t|
    t.string "siret"
    t.string "contact_name"
    t.string "contact_phone"
    t.string "contact_mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_debtors_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "amount"
    t.string "file"
    t.integer "debtor_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debtor_id"], name: "index_invoices_on_debtor_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "debtors", "users"
  add_foreign_key "invoices", "debtors"
  add_foreign_key "invoices", "users"
end
