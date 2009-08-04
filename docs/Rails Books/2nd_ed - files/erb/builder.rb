#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
$: << "../_template/vendor/rails/activesupport/lib/active_support/vendor"

require 'builder/xmlmarkup'

class Product
  def initialize(title, price)
    @title = title
    @price = price
  end
  attr_reader :title, :price
end

@products = [
  Product.new("Pragmatic Programmer", 12.34),
  Product.new("Rails Recipes", 23.45)
]

xml = Builder::XmlMarkup.new(:indent => 2)


xml.div(:class => "productlist") do

  xml.timestamp(Time.now)
  
  @products.each do |product|
    xml.product do
      xml.productname(product.title)
      xml.price(product.price, :currency => "USD")
    end
  end
end

puts xml.target!

