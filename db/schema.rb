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

ActiveRecord::Schema.define(:version => 20110803161539) do

  create_table "deputies", :force => true do |t|
    t.string  "name"
    t.integer "party_id"
    t.string  "pc_img"
    t.string  "pc_profile"
    t.string  "lastname"
    t.string  "firstname"
    t.string  "facebook"
    t.string  "twitter"
    t.integer "predecessor_id"
    t.integer "successor_id"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "deputy_id"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.string "name"
  end

  create_table "reports", :force => true do |t|
    t.string   "email"
    t.string   "page"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seances", :force => true do |t|
    t.integer  "session_id"
    t.integer  "nr"
    t.datetime "start"
    t.datetime "end"
    t.string   "compte_rendu"
  end

  create_table "sessions", :force => true do |t|
    t.string "title"
    t.date   "start"
    t.date   "end"
  end

  create_table "text_topics", :force => true do |t|
    t.integer  "text_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texts", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.string   "link_memorial"
    t.integer  "seance_id"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer "deputy_id"
    t.integer "delegate_id"
    t.integer "text_id"
    t.integer "vote"
  end

end
