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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130319062120) do

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.string   "full_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dvps", :force => true do |t|
    t.integer  "study_id"
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ec_items", :force => true do |t|
    t.string   "name"
    t.string   "proc_name"
    t.string   "description"
    t.string   "message"
    t.string   "reviewer"
    t.string   "author"
    t.string   "compiled_status"
    t.string   "tested_status"
    t.string   "creation_ts"
    t.string   "modification_ts"
    t.string   "modified_by"
    t.integer  "study_id"
    t.integer  "dvp_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "restriction"
  end

  add_index "ec_items", ["dvp_id"], :name => "index_ec_items_on_dvp_id"
  add_index "ec_items", ["study_id"], :name => "index_ec_items_on_study_id"

  create_table "studies", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
