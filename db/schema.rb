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

ActiveRecord::Schema.define(version: 2021_07_29_173855) do

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.string "rg", null: false
    t.date "dt_nasc", null: false
    t.float "balance"
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "account_number"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_type", null: false
    t.float "value", null: false
    t.date "transaction_date", null: false
    t.integer "account_id", null: false
    t.float "previous_balance"
    t.float "new_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  add_foreign_key "transactions", "accounts"
end
