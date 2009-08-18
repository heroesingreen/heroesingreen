#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'

class RoutingTest < Test::Unit::TestCase

  
  def test_recognizes
    # Check the default index action gets generated
    assert_recognizes({"controller" => "store", "action" => "index"}, "/store")
    
    # Check routing to an action
    assert_recognizes({"controller" => "store", "action" => "list"}, 
                      "/store/list")
    
    # And routing with a parameter
    assert_recognizes({ "controller" => "store", 
                        "action" => "add_to_cart", 
                       "id" => "1" },
                      "/store/add_to_cart/1")

    # And routing with a parameter
    assert_recognizes({ "controller" => "store", 
                        "action" => "add_to_cart", 
                        "id" => "1",
                        "name" => "dave" }, 
                      "/store/add_to_cart/1",
                      { "name" => "dave" } )     # like having ?name=dave after the URL

    # Make it a post request
    assert_recognizes({ "controller" => "store", 
                        "action" => "add_to_cart", 
                        "id" => "1" }, 
                      { :path => "/store/add_to_cart/1", :method => :post })
  end
  
  
  
  def test_generates
    assert_generates("/store", :controller => "store", :action => "index")
    assert_generates("/store/list", :controller => "store", :action => "list")
    assert_generates("/store/add_to_cart/1", 
                     { :controller => "store", :action => "add_to_cart", 
                       :id => "1", :name => "dave" },
                     {}, { :name => "dave"})
  end
  
  
  
  def test_routing
    assert_routing("/store", :controller => "store", :action => "index")
    assert_routing("/store/list", :controller => "store", :action => "list")
    assert_routing("/store/add_to_cart/1", 
                   :controller => "store", :action => "add_to_cart", :id => "1")
  end
  
  
  def test_alternate_routing
    assert_generates("/store", :controller => "store")
    
    with_routing do |set|
      set.draw do |map|
        map.connect "shop/:action/:id", :controller => "store"
      
      assert_generates("/shop", :controller => "store")
      assert_recognizes({:controller => "store", :action => "index"}, "/shop")
      end
    end
    
    assert_generates("/store", :controller => "store")
  end    
    
end
