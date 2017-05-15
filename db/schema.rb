# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170515194255) do

  create_table "blockeds", force: :cascade do |t|
    t.integer  "subscriptor_id"
    t.date     "end"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "blockeds", ["subscriptor_id"], name: "index_blockeds_on_subscriptor_id"

  create_table "books", force: :cascade do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "autor"
    t.string   "classification"
    t.integer  "published"
    t.integer  "library_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "token"
  end

  add_index "books", ["library_id"], name: "index_books_on_library_id"

  create_table "borroweds", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "subscriptor_id"
    t.date     "outDate"
    t.date     "returnDate"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "borroweds", ["book_id"], name: "index_borroweds_on_book_id"
  add_index "borroweds", ["subscriptor_id"], name: "index_borroweds_on_subscriptor_id"

  create_table "groups", force: :cascade do |t|
    t.string   "description"
    t.integer  "books"
    t.float    "penalty"
    t.integer  "returnDay"
    t.integer  "renovation"
    t.date     "vigencyStar"
    t.date     "vigencyEnd"
    t.integer  "library_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "groups", ["library_id"], name: "index_groups_on_library_id"

  create_table "libraries", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "copy"
    t.integer  "volumen"
    t.integer  "tome"
    t.integer  "accessible"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["book_id"], name: "index_profiles_on_book_id"

  create_table "reserveds", force: :cascade do |t|
    t.integer  "book_id"
    t.date     "startDate"
    t.date     "finishDate"
    t.integer  "subscriptor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reserveds", ["book_id"], name: "index_reserveds_on_book_id"
  add_index "reserveds", ["subscriptor_id"], name: "index_reserveds_on_subscriptor_id"

  create_table "responsables", force: :cascade do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "telephone"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "responsables", ["library_id"], name: "index_responsables_on_library_id"

  create_table "returneds", force: :cascade do |t|
    t.integer  "book_id"
    t.date     "in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "returneds", ["book_id"], name: "index_returneds_on_book_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "shortname"
    t.string   "responsable"
    t.string   "email"
    t.string   "telephone"
    t.integer  "library_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "schools", ["library_id"], name: "index_schools_on_library_id"

  create_table "subscriptors", force: :cascade do |t|
    t.string   "account"
    t.string   "fullname"
    t.integer  "group_id"
    t.integer  "school_id"
    t.string   "email"
    t.string   "address"
    t.string   "colony"
    t.string   "city"
    t.string   "state"
    t.string   "cp"
    t.string   "telephone"
    t.string   "celular"
    t.string   "picture"
    t.text     "notes"
    t.date     "vigencyStart"
    t.date     "vigencyEnd"
    t.integer  "age"
    t.text     "gurantor"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "subscriptors", ["group_id"], name: "index_subscriptors_on_group_id"
  add_index "subscriptors", ["school_id"], name: "index_subscriptors_on_school_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "fullname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
