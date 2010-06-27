class MissionGameController < ApplicationController
  before_filter :ensure_user, :only => [:explore_world, :world, :find_mission, :search, :current_missions]
  layout :choose_layout
  
  def index
    if(get_user)
      redirect_to(:controller=>:account,:action=>:home)
    end
    @force_refresh_on_login = true
  end
  
  def explore_world
    @worlds = World.all
  end
  
  def world    
    @body_action_id = "explore_world"
    
    @world = nil
    @world = World.find(:first, :conditions=>{:id=>params[:id]}) if params[:id]
    unless(@world)
      redirect_to :action=>:explore_world
    end
    
    
  end
  
  def find_mission
  end
  
  def current_missions
    @all_quests = get_user.missionStatuses.find(:all)
    @completed_quests = @all_quests.select{|quest| (quest.completed?)}
    @upcoming_quests = @all_quests.select{|quest| (!quest.completed?) || quest.mission.repeatable?}
  end
  
  def start
    if(params[:id])
      @mission = Mission.find(params[:id])
    end
    
    unless(@mission)
      @mission = available_missions[rand(available_missions.length)] #Pick a random mission
    end
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
    @search_text = params[:search_text]
    
    if !@search_text || @search_text.strip.blank?
      flash[:error] = "Please enter a search term!"
      redirect_to(:action=>"find_mission")
    end
  
    @search_text = @search_text.downcase
  
    @results = Mission.find(:all, :conditions=>["tags like ?","%#{@search_text}%"])
    
    unless(@result && @result.length > 0)
      @results = Mission.find(:all, :conditions=>["description like ? or title like ?",
                                                    "%#{@search_text}%",
                                                    "%#{@search_text}%"])
    end
    
    @user = get_user
  
    @body_action_id = "find_mission"
  end
   	
  private
  
  def choose_layout 
    case(action_name)
    when 'find_mission'
      return 'mission_central'
    when 'current_missions'
      return 'mission_central'
    when 'search'
      return 'mission_central'
    when 'explore_world'
      return 'mission_central'  
    when 'world'
      return 'mission_central'  
    else
		  return 'mission_game'
	  end
  end 	
end
