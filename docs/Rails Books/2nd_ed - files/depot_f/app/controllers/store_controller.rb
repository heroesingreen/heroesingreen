#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
class StoreController < ApplicationController
  def index
    @products = Product.find_products_for_sale
  end
  
  
  def add_to_cart
    @cart = find_cart                   
    product = Product.find(params[:id])  
    @cart.add_product(product)           
  end
  
  
  
  private
  
  def find_cart
    session[:cart] ||= Cart.new
  end
  
end

