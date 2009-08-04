#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
class PagerController < ApplicationController

  def populate
    User.delete_all
    ["Chris Pine",
     "Chad Fowler",
     "Dave Thomas",
     "Andy Hunt",
     "Adam Keys",
     "Maik Schmidt",
     "Mike Mason",
     "Greg Wilson",
     "Jeffrey Fredrick",
     "James Gray",
     "Daniel Berger",
     "Eric Hodel",
     "Brian Marick",
     "Mike Gunderloy",
     "Ryan Davis",
     "Scott Davis",
     "David Heinemeier Hansson",
     "Scott Barron",
     "Marcel Molina",
     "Brian McCallister",
     "Mike Clark",
     "Esther Derby",
     "Johanna Rothman",
     "Juliet Thomas",
     "Thomas Fuchs"].each {|name| User.create(:name => name)}

    763.times do |i|
      User.create(:name => "ZZUser #{"%03d" % i}")
    end
  end

  
  def user_list
    @user_pages, @users = paginate(:users, :order => 'name')
  end
  

end
