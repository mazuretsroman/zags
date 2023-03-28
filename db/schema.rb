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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_085526) do
  create_table "marriages", force: :cascade do |t|
    t.integer "wife_id"
    t.integer "husband_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["husband_id"], name: "index_marriages_on_husband_id"
    t.index ["wife_id"], name: "index_marriages_on_wife_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "dob"
    t.string "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
