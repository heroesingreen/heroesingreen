#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---

class Sidebar::LinkController < ActionController::Base

  uses_component_template_root


     Link = Struct.new(:name, :url)

     def self.find(*ignored)
       [ Link.new("pragdave", "http://blogs.pragprog.com/pragdave"),
         Link.new("automation", "http://pragmaticautomation.com")
       ]
     end


  def get_links
    @links = self.class.find(:all)
    render(:layout => false)
  end

end

