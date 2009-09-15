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

ActiveRecord::Schema.define(:version => 20090818062121) do

  create_table "gardens", :force => true do |t|
    t.string   "name"
    t.integer  "size_x"
    t.integer  "size_y"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mission_statuses", :force => true do |t|
    t.integer  "mission_id"
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "int_data"
    t.date     "startDate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repeats",    :default => 0
  end

  create_table "missions", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "description"
    t.string   "task"
    t.string   "reward"
    t.integer  "points"
    t.integer  "repeatable"
    t.integer  "unitPoints"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tags"
  end

  create_table "plant_templates", :force => true do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "max_health"
    t.integer  "virility"
    t.integer  "strength"
    t.integer  "min_light"
    t.integer  "shade_generated"
    t.integer  "min_water"
    t.integer  "water_consumption"
    t.integer  "layer_req"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plants", :force => true do |t|
    t.integer  "plant_template_id"
    t.integer  "plot_id"
    t.integer  "health"
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plots", :force => true do |t|
    t.integer  "garden_id"
    t.integer  "layer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "total_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
