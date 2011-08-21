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

ActiveRecord::Schema.define(:version => 20110622123403) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "category_id"
    t.boolean  "is_top"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_valid"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_valid"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                           :default => "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "complaints", :force => true do |t|
    t.integer  "type_id"
    t.string   "desc"
    t.integer  "user_id"
    t.integer  "complaintable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "complaintable_type"
  end

  create_table "flashes", :force => true do |t|
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url"
  end

  create_table "focus", :force => true do |t|
    t.integer  "focusable_id"
    t.string   "focusable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "focus", ["focusable_id"], :name => "index_focus_on_focusable_id"
  add_index "focus", ["focusable_type"], :name => "index_focus_on_focusable_type"
  add_index "focus", ["user_id"], :name => "index_focus_on_user_id"

  create_table "goods", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_valid"
  end

  create_table "integrals", :force => true do |t|
    t.integer  "point"
    t.string   "desc"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "integralable_id"
    t.string   "integralable_type", :limit => 64
  end

  create_table "msgs", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "user_id"
    t.integer  "to"
    t.boolean  "is_read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outlinks", :force => true do |t|
    t.string   "url"
    t.boolean  "verified"
    t.integer  "outlinkable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "outlinkable_type"
  end

  create_table "prices", :force => true do |t|
    t.float    "price"
    t.integer  "type_id"
    t.integer  "region_id"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "finish_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "good_id"
    t.string   "address"
    t.boolean  "is_valid"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "records", :force => true do |t|
    t.integer  "recordable_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "recordable_type"
  end

  create_table "uploads", :force => true do |t|
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
