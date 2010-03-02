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
  
  def get_user
    if(!session[:user_id])
      return nil
    end
    
	  logged_in_user = User.find(session[:user_id])
	  if logged_in_user == nil #user id is invalid, remove it from session  		   
	  	session[:user_id] = nil
	  	redirect_to :controller=>'account', :action=>'login'
	  end
	  return logged_in_user
  end
  
  def ensure_user
    begin
      unless(session[:user_id] && User.find(session[:user_id]))
        session[:user_id] = nil
  	  	redirect_to :controller=>'account', :action=>'login'      
      end
    rescue ActiveRecord::RecordNotFound
        session[:user_id] = nil
      	redirect_to :controller=>'account', :action=>'login'      
    end
  end
  
  def available_missions
  	logged_in_user = get_user
  	available_missions = Mission.all
  	if(logged_in_user) 		
  		done_missionStatuses = logged_in_user.missionStatuses
  		done_missionStatuses.each{
  			|missionStatus| 
  			available_missions.delete_if{
  				|mission|
  				(mission==missionStatus.mission) && missionStatus.mission.oneshot? && !missionStatus.deactivated?
  				}
  			}
   	end
   	if available_missions.empty?
   		flash[:notice] = "Sorry, there are no more missions for now!"
   		redirect_to(:controller=>:account, :action=>:home)
    	return
    end
   	return available_missions
  end
	
end
