# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def get_current_garden
  # => figure out what user we have
  	logged_in_user = User.find(session[:user_id])
  # => get all that users gardens
  	all_gardens = logged_in_user.gardens
  # => If there are not any, create one
  # => if there are one or more, then return the first one
  	if all_gardens.empty?
  		logged_in_user.add_garden
  	end
  	return all_gardens.first
  end
  
  def get_user(user_id)
  	if user_id!=nil
	    logged_in_user = User.find(session[:user_id])
  	  if logged_in_user == nil #user id is invalid, remove it from session  		   
  	  	user_id = nil
  	  	session[:user_id] = nil
  	  end
	    return logged_in_user
	  end
  end
  	
end
