#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
# Schema as of June 12, 2006 15:45 (schema version 7)
#
# Table name: line_items
#
#  id          :integer(11)   not null, primary key
#  product_id  :integer(11)   default(0), not null
#  order_id    :integer(11)   default(0), not null
#  quantity    :integer(11)   default(0), not null
#  total_price :integer(11)   default(0), not null
#


class LineItem < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product

  
  def self.from_cart_item(cart_item)
    li = self.new
    li.product     = cart_item.product
    li.quantity    = cart_item.quantity
    li.total_price = cart_item.price
    li
  end
  

end

