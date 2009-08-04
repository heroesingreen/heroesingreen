#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
module TestHelper
  def show(xml, str)
    res = eval(str)
    xml.dt(:newline => "yes") do
      xml.inlinecode("<%= " + str + " %>")
    end
    xml.dd do
      xml.p(res)
    end
  end
  
end
