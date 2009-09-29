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

ActiveRecord::Schema.define(:version => 20090929043042) do

  create_table "gardens", :force => true do |t|
    t.string   "name"
    t.integer  "size_x"
    t.integer  "size_y"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "default_wetness"
    t.integer  "default_nutrients"
  end

  create_table "grounds", :force => true do |t|
    t.integer  "garden_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "wetness"
    t.integer  "nutrients"
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
    t.integer  "health_max"
    t.integer  "virility"
    t.integer  "light_min"
    t.integer  "water_min"
    t.integer  "water_consumption"
    t.integer  "layer_max"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_path"
    t.integer  "water_max"
    t.integer  "light_max"
    t.integer  "nutrients_min"
    t.integer  "nutrients_max"
    t.integer  "nutrients_consumption"
    t.float    "vertical_rate"
    t.float    "radial_rate"
    t.float    "density_rate"
  end

  create_table "plants", :force => true do |t|
    t.integer  "plant_template_id"
    t.integer  "health"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "height"
    t.integer  "radius"
    t.integer  "ground_id"
    t.integer  "layer_id"
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
