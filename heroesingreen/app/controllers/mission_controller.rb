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
  	session[:mission_status] = MissionStatus.new(:mission=>@mission)
    @mission_status = session[:mission_status]    
    
    verify_user(session[:user_id])
    if(@logged_in_user)
   		@mission_status= @logged_in_user.add_mission_status(@mission_status)
   		@mission_status.activate
   		@mission_status.save!
   	end
  end
 
  def complete
    unless(session[:mission_status]!=nil)
    	#session not found, restart mission
    	redirect_to(:action=>:start)
    	return
    end
    @mission_status = session[:mission_status]
    @mission  = @mission_status.mission
    
    verify_user(session[:user_id])
    if(@logged_in_user)
   		@mission_status = @logged_in_user.add_mission_status(@mission_status)
   		@mission_status.complete
   		@mission_status.save!
   	end
   	
   	#mission complete, clear session
   	session[:mission_status] = nil
  end
 
  private
  
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
