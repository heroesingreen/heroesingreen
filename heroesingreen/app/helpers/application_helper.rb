# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def get_user
    if(!session[:user_id])
      return nil
    end
    
	  logged_in_user = User.find(session[:user_id])
	  if logged_in_user == nil #user id is invalid, remove it from session  		   
	  	session[:user_id] = nil
	  	redirect_to :controller=>'users', :action=>'login'
	  end
	  return logged_in_user
  end
end
