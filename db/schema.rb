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

ActiveRecord::Schema.define(version: 20170309194359) do

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
  end

  create_table "responsables", force: :cascade do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "telephone"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "responsables", ["library_id"], name: "index_responsables_on_library_id"

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
