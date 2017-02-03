ActiveRecord::Schema.define(version: 20170130070727) do

  create_table "cuisines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_favorites_on_recipe_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "food_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.integer  "people"
    t.integer  "time"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "difficulty"
    t.text     "ingredients"
    t.text     "procedure"
    t.string   "image"
    t.integer  "cuisine_id"
    t.integer  "food_type_id"
    t.integer  "user_id"
    t.integer  "favorite_number", default: 0
    t.index ["cuisine_id"], name: "index_recipes_on_cuisine_id"
    t.index ["food_type_id"], name: "index_recipes_on_food_type_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "available"
    t.string   "type"
  end

end
