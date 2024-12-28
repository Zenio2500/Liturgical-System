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

ActiveRecord::Schema[8.0].define(version: 2024_12_27_134539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "dashes", force: :cascade do |t|
    t.bigint "reader_id"
    t.bigint "absolute_frequency"
    t.float "relative_frequency"
    t.bigint "total_escalations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reader_id"], name: "index_dashes_on_reader_id"
  end

  create_table "escalations", force: :cascade do |t|
    t.datetime "effective_date"
    t.string "liturgical_time"
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escalations_readers", force: :cascade do |t|
    t.bigint "escalation_id"
    t.bigint "reader_id"
    t.string "role"
    t.boolean "did_serve"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escalation_id"], name: "index_escalations_readers_on_escalation_id"
    t.index ["reader_id"], name: "index_escalations_readers_on_reader_id"
  end

  create_table "readers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dash_id"
    t.index ["dash_id"], name: "index_readers_on_dash_id"
  end

  add_foreign_key "readers", "dashes"
end
