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

ActiveRecord::Schema.define(:version => 20130405171304) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "channel_id"
  end

  add_index "categories", ["channel_id"], :name => "index_categories_on_channel_id"

  create_table "channels", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "links", :force => true do |t|
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topic_links", :force => true do |t|
    t.integer  "link_id"
    t.integer  "topic_id"
    t.integer  "score",       :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
  end

  add_index "topic_links", ["link_id"], :name => "index_topic_links_on_link_id"
  add_index "topic_links", ["score"], :name => "index_topic_links_on_score"
  add_index "topic_links", ["topic_id"], :name => "index_topic_links_on_topic_id"
  add_index "topic_links", ["user_id"], :name => "index_topic_links_on_user_id"

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "best_link_id"
    t.integer  "category_id"
    t.integer  "user_id"
  end

  add_index "topics", ["best_link_id"], :name => "index_topics_on_best_link_id"
  add_index "topics", ["category_id"], :name => "index_topics_on_category_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "twitter_auths", :force => true do |t|
    t.integer  "user_id"
    t.integer  "twitter_id"
    t.string   "twitter_handle"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "token"
    t.string   "secret"
  end

  create_table "twitter_friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "twitter_friendships", ["friend_id"], :name => "index_twitter_friendships_on_friend_id"
  add_index "twitter_friendships", ["user_id"], :name => "index_twitter_friendships_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "email"
    t.integer  "role"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_link_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "status"
  end

  add_index "votes", ["topic_link_id"], :name => "index_votes_on_topic_link_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
