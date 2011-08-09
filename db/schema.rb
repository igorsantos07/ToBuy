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

ActiveRecord::Schema.define(:version => 9) do

  create_table "accounts", :force => true do |t|
    t.string  "name"
    t.string  "surname"
    t.string  "email"
    t.string  "crypted_password"
    t.string  "role"
    t.integer "lists_count",      :default => 0, :null => false
  end

  create_table "currencies", :force => true do |t|
    t.string "code",   :limit => 3,  :null => false
    t.string "name",   :limit => 30, :null => false
    t.string "symbol", :limit => 4,  :null => false
  end

  add_index "currencies", ["code"], :name => "index_currencies_on_code", :unique => true
  add_index "currencies", ["name"], :name => "index_currencies_on_name", :unique => true

  create_table "items", :force => true do |t|
    t.string  "code",    :limit => 30
    t.string  "name",    :limit => 100
    t.decimal "price"
    t.text    "url"
    t.integer "list_id"
    t.text    "comment"
  end

  add_index "items", ["list_id"], :name => "index_items_on_list_id"

  create_table "lists", :force => true do |t|
    t.string  "name",        :limit => 49,                    :null => false
    t.integer "account_id"
    t.integer "currency_id"
    t.boolean "bought",                    :default => false, :null => false
    t.integer "items_count",               :default => 0,     :null => false
  end

  add_index "lists", ["account_id"], :name => "index_lists_on_user_id"
  add_index "lists", ["currency_id"], :name => "index_lists_on_currency_id"

end
