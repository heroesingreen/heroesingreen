#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"

#ActiveRecord::Base.logger = Logger.new(STDOUT)

require "rubygems"
require_gem "activerecord"


ActiveRecord::Schema.define do
  
  create_table :products, :force => true do |t|
    t.column :title, :string
    t.column :description, :text
    # ...
    t.column :line_items_count, :integer, :default => 0
  end
  
  
  create_table :line_items, :force => true do |t|
    t.column :product_id, :integer
    t.column :order_id,   :integer
    t.column :quantity,   :integer
    t.column :unit_price, :decimal, :precision => 8, :scale => 2
  end
  
end

class Product < ActiveRecord::Base
  has_many :line_items
end


class LineItem < ActiveRecord::Base
  belongs_to :product, :counter_cache => true
end



product = Product.create(:title => "Programming Ruby",
                         :description => " ... ")
line_item = LineItem.new
line_item.product = product
line_item.save
puts "In memory size = #{product.line_items.size}"             #=> 0
puts "Refreshed size = #{product.line_items(:refresh).size}"   #=> 1




LineItem.delete_all
Product.delete_all


product = Product.create(:title => "Programming Ruby", 
                         :description => " ... ")
product.line_items.create
puts "In memory size = #{product.line_items.size}"             #=> 1
puts "Refreshed size = #{product.line_items(:refresh).size}"   #=> 1




