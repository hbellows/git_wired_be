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

ActiveRecord::Schema.define(version: 2019_02_21_002939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "github_id"
    t.bigint "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_cards_on_column_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_columns", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_project_columns_on_column_id"
    t.index ["project_id"], name: "index_project_columns_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "github_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.string "github_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "html_url"
  end

  create_table "repository_projects", force: :cascade do |t|
    t.bigint "repository_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_repository_projects_on_project_id"
    t.index ["repository_id"], name: "index_repository_projects_on_repository_id"
  end

  create_table "repository_wireframes", force: :cascade do |t|
    t.bigint "wireframe_id"
    t.bigint "repository_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repository_id"], name: "index_repository_wireframes_on_repository_id"
    t.index ["wireframe_id"], name: "index_repository_wireframes_on_wireframe_id"
  end

  create_table "user_repositories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "repository_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repository_id"], name: "index_user_repositories_on_repository_id"
    t.index ["user_id"], name: "index_user_repositories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "user_name"
    t.string "github_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wireframes", force: :cascade do |t|
    t.string "name"
    t.text "object"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "columns"
  add_foreign_key "project_columns", "columns"
  add_foreign_key "project_columns", "projects"
  add_foreign_key "repository_projects", "projects"
  add_foreign_key "repository_projects", "repositories"
  add_foreign_key "repository_wireframes", "repositories"
  add_foreign_key "repository_wireframes", "wireframes"
  add_foreign_key "user_repositories", "repositories"
  add_foreign_key "user_repositories", "users"
end
