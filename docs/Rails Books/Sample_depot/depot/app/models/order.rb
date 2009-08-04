class Order < ActiveRecord::Base
  has_many :line_items
  
  PAYMENT_TYPES = [
    # Displayed     stored in db
    [ "Check",      "check"],
    [ "Credit Card","cc"],
    [ "Purchase order","po"]
  ]
  
  validates_presence_of :name, :address, :email, :paytype
  validates_inclusion_of :paytype, :in=>PAYMENT_TYPES.map{|disp, value|value}
  
  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end
end
