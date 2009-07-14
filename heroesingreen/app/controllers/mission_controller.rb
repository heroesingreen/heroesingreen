class MissionController < ApplicationController
  def index
    
  end
  
  def start
    all_missions = Mission.all
    @mission = all_missions[rand(all_missions.length)] #Pick a random mission
  end
  
  #Mission status is always created when you accept a mission
  def accept
  	@mission = Mission.find(params[:id])
     
    logged_in_user = get_user(session[:user_id])
    if(logged_in_user)
    	@mission_status = logged_in_user.missionStatuses.find_or_create_by_mission_id(@mission.id)
    	@mission_status.activate!
   		@mission_status.save!
   	end
  end
 
  def complete
    unless(params[:id]!=nil)
    	#mission id not found
    	redirect_to(:action=>:start)
    	return
    end    
    @mission  = Mission.find(params[:id])
    @not_logged_in = true
    @force_refresh_on_login = true
    
    logged_in_user = get_user(session[:user_id])
    if(logged_in_user)
   		@mission_status = logged_in_user.missionStatuses.find_or_create_by_mission_id(@mission.id)
   		@mission_status.complete!
   		@mission_status.save!
   		@not_logged_in = false
   	end
  end
 
  private
  
  def get_user(user_id)
  	 if user_id!=nil
	  logged_in_user = User.find(session[:user_id])
	  if logged_in_user == nil #user id is invalid, remove it from session  		   
	  	user_id = nil
	  	session[:user_id] = nil
	  end
	  logged_in_user
	end
  end
end
