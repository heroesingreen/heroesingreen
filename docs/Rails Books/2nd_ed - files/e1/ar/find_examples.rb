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

ActiveRecord::Base.logger = Logger.new(STDOUT)


require "rubygems"
require_gem "activerecord"
require "pp"

@params = {}
def params
  @params
end

class Order < ActiveRecord::Base
end

class LineItem < ActiveRecord::Base
end

class Product < ActiveRecord::Base
end


# return an arbitrary order
order = Order.find(:first)

# return an order for Dave
order = Order.find(:first, :conditions => "name = 'Dave Thomas'")

# return the latest order for Dave
order = Order.find(:first,
                   :conditions => "name = 'Dave Thomas'", 
                   :order      => "id DESC")



orders = LineItem.find_by_sql("select line_items.* from line_items, orders " +
                              " where order_id = orders.id                 " +
                              "   and orders.name = 'Dave Thomas'          ")




orders = Order.find_by_sql("select name, pay_type from orders")

first = orders[0]
p first.attributes
p first.attribute_names
p first.attribute_present?("address")


Product.delete_all
LineItem.delete_all
p = Product.create(:title => "Programming Ruby", :date_available => Time.now)
LineItem.create(:quantity => 2, :unit_price => 44.95, :product_id => p.id)


items = LineItem.find_by_sql("select *,                                  " +
                             "       quantity*unit_price as total_price, " +
                             "       products.title as title             " +
                             "  from line_items, products                " +
                             " where line_items.product_id = products.id ")
li = items[0]
puts "#{li.title}: #{li.quantity}x#{li.unit_price} => #{li.total_price}"



c1 = Order.count
c2 = Order.count(["name = ?", "Dave Thomas"])
c3 = LineItem.count_by_sql("select count(*)                        " +
                           "  from line_items, orders              " +
                           " where line_items.order_id = orders.id " +
                           "   and orders.name = 'Dave Thomas'     ")
puts "Dave has #{c3} line items in #{c2} orders (#{c1} orders in all)"



order  = Order.find_by_name("Dave Thomas")
orders = Order.find_all_by_name("Dave Thomas")
order  = Order.find_all_by_email(params['email'])


o = LineItem.find(:all,
                  :conditions => "pr.title = 'Programming Ruby'",
                  :joins => "as li inner join products as pr on li.product_id = pr.id")
p o.size


res = Order.update_all("pay_type = 'wibble'")
p res

res = Order.delete_all(["pay_type = ?", "wibble"])
p res
