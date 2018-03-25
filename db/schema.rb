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

ActiveRecord::Schema.define(version: 20180322023432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "tag"
    t.integer "quantity"
    t.string "description"
    t.string "value"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.string "meal_id"
    t.string "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutritional_data", force: :cascade do |t|
    t.integer "age"
    t.string "gender"
    t.float "exercise"
    t.float "procnt"
    t.float "fibtg"
    t.float "vita_iu"
    t.float "thiamin"
    t.float "riboflavin"
    t.float "niacin"
    t.float "vitamin_b6"
    t.float "vitamin_b12"
    t.float "folate"
    t.float "vitc"
    t.float "ca"
    t.float "iodine"
    t.float "fe"
    t.float "magnesium"
    t.float "k"
    t.float "na"
    t.float "zinc"
    t.float "enerc_kcal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "chole"
    t.float "fatrn"
    t.float "fasat"
    t.float "chocdf"
    t.float "sugar"
    t.float "fat"
  end

  create_table "past_meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "description", default: "A meal"
    t.float "na"
    t.float "fatrn"
    t.float "fasat"
    t.float "chocdf"
    t.float "fibtg"
    t.float "procnt"
    t.float "vitc"
    t.float "ca"
    t.float "fe"
    t.float "sugar"
    t.float "enerc_kcal"
    t.float "fat"
    t.float "vita_iu"
    t.float "k"
    t.float "chole"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "description"
    t.text "image_url"
    t.string "yumID"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "yummly_search"
  end

  create_table "user_requirements", force: :cascade do |t|
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "requirement_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "age"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
