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
    t.column :image_url, :string
    t.column :price, :decimal, :precision => 10, :scale => 2
    t.column :available_at, :datetime
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
  belongs_to :product
end


LineItem.delete_all

p = Product.create(:title => "Programming Ruby", :available_at => Time.now)
l = LineItem.new
l.id = 2
l.product = p
l.save!

l = LineItem.new
l.product = p
l.save!

puts "\n\nSimple Belongs to"


item = LineItem.find(2)

# item.product is the associated Product object
puts "Current product is #{item.product.id}"
puts item.product.title

item.product = Product.new(:title          => "Rails for Java Developers",
                           :description    => "...",
                           :image_url      => "http://....jpg",
                           :price          => 34.95,
                           :available_at   => Time.now)
item.save!

puts "New product is #{item.product.id}"
puts item.product.title


puts "\n\nCreate belongs to"

item = LineItem.find(2)

# item.product is the associated Product object
puts "Current product is #{item.product.id}"
puts item.product.title


item.create_product(:title          => "Rails Recipes",
                    :description    => "...",
                    :image_url      => "http://....jpg",
                    :price          => 32.95,
                    :available_at   => Time.now)


puts "New product is #{item.product.id}"
puts item.product.title

puts "\n\nproduct belongs to"

item = LineItem.find(2)

# item.product is the associated Product object
puts "Current product is #{item.product.id}"
puts item.product.title

item = LineItem.new()

item.create_product(:title          => "Advanced Rails", 
                    :description    => "...",
                    :image_url      => "http://....jpg",
                    :price          => 34.95,
                    :available_at   => Time.now)

puts "New product is #{item.product.id}"
puts item.product.title

item.save!
p item.product(true)

puts "============="

prod = Product.find(item.product_id)
p prod.line_items.size

