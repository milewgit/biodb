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

ActiveRecord::Schema.define(version: 20140801011125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: true do |t|
    t.string   "company"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "synopsis"
  end

  add_index "jobs", ["company", "title", "start_date"], name: "index_jobs_on_company_and_title_and_start_date", unique: true, using: :btree

  create_table "skills", force: true do |t|
    t.integer  "job_id"
    t.string   "name"
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["job_id", "name"], name: "index_skills_on_job_id_and_name", unique: true, using: :btree
  add_index "skills", ["job_id"], name: "index_skills_on_job_id", using: :btree

end
