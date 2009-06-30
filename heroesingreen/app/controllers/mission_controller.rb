class MissionController < ApplicationController
  def index
    
  end
  
  def start
    all_missions = Mission.all
    @mission = all_missions[rand(all_missions.length)] #Pick a random mission
  end
  
  def accept
  	@mission = Mission.find(params[:id])
    @mission_status = find_mission_status
    @mission_status.activate
    
    verify_user(session[:user_id])
    if(@logged_in_user)
   		@logged_in_user.add_mission_status(@mission_status)
   	end
  end
 
  def complete
    @mission = Mission.find(params[:id])
    @mission_status = find_mission_status
    @mission_status.complete
    
    verify_user(session[:user_id])
    if(@logged_in_user)
   		@logged_in_user.add_mission_status(@mission_status)
   	end
  end
 
  private
  
  def find_mission_status
    session[:mission_status] ||= MissionStatus.new
  end
  
  def verify_user(user_id)
  	 if user_id!=nil
	  @logged_in_user = User.find(session[:user_id])
	  if @logged_in_user == nil #user id is invalid, remove it from session  		   
	  	@user_id = nil
	  	session[:user_id] = nil
	  end
	end
  end
end
