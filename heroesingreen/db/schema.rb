# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090617034005) do

  create_table "mission_statuses", :force => true do |t|
    t.integer  "mission_id"
    t.integer  "status"
    t.integer  "int_data"
    t.date     "startDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missions", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "description"
    t.string   "task"
    t.string   "reward"
    t.integer  "points"
    t.integer  "type"
    t.integer  "unitPoints"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "total_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end