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

ActiveRecord::Schema.define(version: 20181002034012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.bigint "meal_food_id"
    t.index ["meal_food_id"], name: "index_foods_on_meal_food_id"
  end

  create_table "meal_foods", force: :cascade do |t|
    t.bigint "meal_id"
    t.bigint "food_id"
    t.index ["food_id"], name: "index_meal_foods_on_food_id"
    t.index ["meal_id"], name: "index_meal_foods_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.bigint "meal_food_id"
    t.index ["meal_food_id"], name: "index_meals_on_meal_food_id"
  end

  add_foreign_key "foods", "meal_foods"
  add_foreign_key "meal_foods", "foods"
  add_foreign_key "meal_foods", "meals"
  add_foreign_key "meals", "meal_foods"
end
