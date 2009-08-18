#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 6) do

  create_table "accolades", :force => true do |t|
    t.column "name",     :string
    t.column "received", :date
    t.column "user_id",  :integer
  end

  create_table "languages", :force => true do |t|
    t.column "name",          :string
    t.column "shortest_wiki", :integer
  end

  create_table "todos", :force => true do |t|
    t.column "name",      :string
    t.column "completed", :datetime
    t.column "user_id",   :integer
    t.column "position",  :integer
  end

  create_table "users", :force => true do |t|
    t.column "username",          :string
    t.column "favorite_language", :string
    t.column "created_at",        :datetime
    t.column "updated_at",        :datetime
    t.column "lock_version",      :integer,  :default => 0
  end

  create_table "zips", :force => true do |t|
    t.column "zip",          :string
    t.column "city",         :string
    t.column "state",        :string
    t.column "created_at",   :datetime
    t.column "edited_at",    :datetime
    t.column "lock_version", :integer,  :default => 0
  end

end