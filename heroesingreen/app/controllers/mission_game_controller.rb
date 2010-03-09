class MissionGameController < ApplicationController
  layout :choose_layout
  
  def index
    if(get_user)
      redirect_to(:controller=>:account,:action=>:home)
    end
    @force_refresh_on_login = true
  end
  
  def mission_central
    @missions = available_missions
  end
  
  def start
    @mission = available_missions[rand(available_missions.length)] #Pick a random mission
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
   		redirect_to(:controller=>:account, :action=>:home)
   	end
  end

  def search
  	puts "Available missions: #{available_missions.inspect}"
    	@selected_missions = available_missions.select{ |mission|
    	mission.repeatable == params[:repeatable].to_i
	}
	puts "Selected missions: #{@selected_missions.inspect}"
  end
   	
  private
  
  def choose_layout 
    case(action_name)
    when 'mission_central'
      return 'account'
    when 'search'
      return 'account'
    else
		  return 'mission_game'
	  end
  end 	
end
