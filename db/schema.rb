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

ActiveRecord::Schema.define(:version => 20130403031845) do

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
    t.string   "tested_status"
    t.string   "creation_ts"
    t.string   "modification_ts"
    t.string   "modified_by"
    t.integer  "study_id"
    t.integer  "dvp_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "restriction"
    t.integer  "domain_id"
    t.string   "check_method"
    t.string   "programmed_status"
    t.string   "removed"
  end

  add_index "ec_items", ["domain_id"], :name => "index_ec_items_on_domain_id"
  add_index "ec_items", ["dvp_id"], :name => "index_ec_items_on_dvp_id"
  add_index "ec_items", ["study_id"], :name => "index_ec_items_on_study_id"

  create_table "studies", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "login"
    t.string   "username"
    t.text     "ldap_entries"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
