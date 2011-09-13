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

ActiveRecord::Schema.define(:version => 20110911052327) do

  create_table "promotions", :force => true do |t|
    t.string   "rank"
    t.integer  "user_id"
    t.date     "promotion_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "style_id"
  end

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.string   "country_of_origin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "technique_repetitions", :force => true do |t|
    t.integer  "technique_id"
    t.integer  "user_id"
    t.integer  "repetitions"
    t.integer  "workout_session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "techniques", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style"
  end

  create_table "workout_sessions", :force => true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.date     "workout_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
