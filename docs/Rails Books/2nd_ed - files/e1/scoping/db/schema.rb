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

ActiveRecord::Schema.define(:version => 1) do

  create_table "accounts", :force => true do |t|
    t.column "number",  :string
    t.column "balance", :integer, :limit => 10, :precision => 10, :scale => 0, :default => 0
  end

  create_table "articles", :force => true do |t|
    t.column "content", :text
  end

  create_table "bad_books", :id => false, :force => true do |t|
    t.column "isbn",  :string, :limit => 50,  :default => "", :null => false
    t.column "title", :string, :limit => 200
  end

  create_table "bools", :force => true do |t|
    t.column "flag", :boolean
  end

  create_table "catalog_entries", :force => true do |t|
    t.column "name",          :string
    t.column "acquired_at",   :datetime
    t.column "resource_id",   :integer
    t.column "resource_type", :string
  end

  create_table "categories", :force => true do |t|
    t.column "name",      :string
    t.column "parent_id", :integer
    t.column "lft",       :integer
    t.column "rgt",       :integer
  end

  create_table "categories_products", :id => false, :force => true do |t|
    t.column "category_id", :integer, :default => 0, :null => false
    t.column "product_id",  :integer, :default => 0, :null => false
  end

  add_index "categories_products", ["product_id"], :name => "fk_cp_product"

  create_table "children", :force => true do |t|
    t.column "parent_id", :integer
    t.column "name",      :string
    t.column "position",  :integer
  end

  create_table "counters", :force => true do |t|
    t.column "count",        :integer
    t.column "lock_version", :integer, :default => 0
  end

  create_table "customers", :force => true do |t|
    t.column "created_at",     :datetime
    t.column "credit_limit",   :integer,  :limit => 10, :precision => 10, :scale => 0, :default => 100
    t.column "first_name",     :string
    t.column "initials",       :string
    t.column "last_name",      :string
    t.column "last_purchase",  :datetime
    t.column "purchase_count", :integer,                                               :default => 0
  end

  create_table "employees", :force => true do |t|
    t.column "name",       :string,  :limit => 200, :default => "", :null => false
    t.column "manager_id", :integer
    t.column "mentor_id",  :integer
  end

  add_index "employees", ["manager_id"], :name => "fk_manager"
  add_index "employees", ["mentor_id"], :name => "fk_mentor"

  create_table "images", :force => true do |t|
    t.column "content", :binary
  end

  create_table "imagess", :force => true do |t|
    t.column "content", :binary
  end

  create_table "invoices", :force => true do |t|
    t.column "order_id", :integer
  end

  create_table "line_items", :force => true do |t|
    t.column "product_id", :integer
    t.column "order_id",   :integer
    t.column "quantity",   :integer
    t.column "unit_price", :integer, :limit => 10, :precision => 10, :scale => 0
  end

  create_table "orders", :force => true do |t|
    t.column "user_id", :integer
  end

  create_table "parents", :force => true do |t|
  end

  create_table "payments", :force => true do |t|
  end

  create_table "people", :force => true do |t|
    t.column "type",       :string
    t.column "name",       :string
    t.column "email",      :string
    t.column "balance",    :integer, :limit => 10, :precision => 10, :scale => 0
    t.column "reports_to", :integer
    t.column "dept",       :integer
  end

  create_table "products", :force => true do |t|
    t.column "title",            :string
    t.column "description",      :text
    t.column "line_items_count", :integer, :default => 0
  end

  create_table "purchases", :force => true do |t|
    t.column "name",      :string
    t.column "last_five", :text
  end

  create_table "readings", :force => true do |t|
    t.column "article_id", :integer
    t.column "user_id",    :integer
    t.column "read_at",    :datetime
    t.column "rating",     :integer
  end

  create_table "refunds", :force => true do |t|
  end

  create_table "sounds", :force => true do |t|
    t.column "content", :binary
  end

  create_table "users", :force => true do |t|
    t.column "name", :string
  end

end
