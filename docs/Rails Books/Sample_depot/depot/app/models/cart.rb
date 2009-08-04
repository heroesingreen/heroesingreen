#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
class Cart
  
  attr_reader :items
  
  def initialize
    @items = []
    
    #Add stub items to cart
    #products = Product.find_products_for_sale
    #for product in products
    #   @items << CartItem.new(product)
    #end
  end

  def total_price
    @items.sum {|item| item.price}
  end
  
  def total_items
    @items.sum{ |item| item.quantity}
  end
  
  def add_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      current_item = CartItem.new(product,1)
      @items << current_item
    end
    current_item
  end
  
   def remove_product(product)
    current_item = @items.find {|item|item.product == product}
    if current_item
      current_item.decrement_quantity
      if current_item.quantity == 0
        @items.delete(current_item)
      end
    end
    current_item
  end
  
end
