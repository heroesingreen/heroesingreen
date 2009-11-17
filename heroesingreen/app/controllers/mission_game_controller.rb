class MissionGameController < ApplicationController
  def index
    
  end
  
  def start
  	logged_in_user = get_user
  	all_missions = Mission.all
  	done_missions = nil
  	if(logged_in_user) 		
  		done_missionStatuses = logged_in_user.missionStatuses
  		done_missionStatuses.each{
  			|missionStatus| 
  			all_missions.delete_if{
  				|mission|
  				(mission==missionStatus.mission) && missionStatus.mission.oneshot? && !missionStatus.deactivated?
  				}
  			}
   	end
   	if all_missions.empty?
   		flash[:notice] = "Sorry, there are no more missions for now!"
   		redirect_to(:controller=>:users, :action=>:stats)
    	return
    end
    @mission = all_missions[rand(all_missions.length)] #Pick a random mission
  end
  
  #Mission status is always created when you accept a mission
  def accept
  	@mission = Mission.find(params[:id])
     
    logged_in_user = get_user
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
    @logged_in_user = get_user
    if(@logged_in_user)
   		@mission_status = @logged_in_user.missionStatuses.find_or_create_by_mission_id(@mission.id)
   		@mission_status.complete!
   		@mission_status.save!
      @logged_in_user.add_points(@mission.points)
   		@not_logged_in = false
   	end
  end
  
  def drop
  	unless(params[:id]!=nil)
  		#mission id not found
  		redirect_to(:action=>:start) 
  		return
  	end
  	@mission  = Mission.find(params[:id])
    @not_logged_in = true
    @force_refresh_on_login = true
    logged_in_user = get_user
  	if(logged_in_user)
   		@mission_status = logged_in_user.missionStatuses.find_or_create_by_mission_id(@mission.id)
   		@mission_status.drop!
   		@mission_status.save!
   		@not_logged_in = false
   		redirect_to(:controller=>:users, :action=>:stats)
   	end
  end
   	
end
