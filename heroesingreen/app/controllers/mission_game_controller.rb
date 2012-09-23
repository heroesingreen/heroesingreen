class MissionGameController < ApplicationController
  before_filter :authenticate_user!, :only => [:explore_world, :world, :find_mission, :search, :current_missions, :missions]
  #before_filter :ensure_user, :only => [:explore_world, :world, :find_mission, :search, :current_missions, :missions]
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
  
  def missions
    @mission = Mission.all
  end
  
  
  def world    
    @body_action_id = "explore_world"
    
    @world = nil
    @world = World.find(:first, :conditions=>{:id=>params[:id]}) if params[:id]
    unless(@world)
      redirect_to :action=>:explore_world
    end
    
    
  end
  
  def world_missions
    unless params[:id]
      render :text=>"Unknown region"
      return
    end
    
    @region = WorldMission.find(params[:id])
  end
  
  def find_mission
    # TODO: THIS IS HORRIBLE!  Find the proper join syntax for this
    # In addition, it should be in the model probably
    @missions = Mission.all :joins => :mission_statuses, :conditions => ["((mission_statuses.status != ?) AND (mission_statuses.user_id = ? AND missions.repeatable = ?))", MissionStatus::ACTIVATED_STATUS.to_s, get_user.id.to_s, 1]
    @m = Mission.find(:all, :conditions => ['id not in (SELECT mission_id FROM mission_statuses)'])
    @missions = @missions | @m
    @m_count = 1
  end
  
  def current_missions
	@missions = get_user.missionStatuses.select{|s| s.activated?}.map{|m| m.mission}

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
      logger.info "Good!"
      @mission_status = logged_in_user.missionStatuses.find_or_create_by_mission_id(@mission.id)
      @mission_status.activate!
      @mission_status.save!

      logger.info "Mission status!"
      logger.info @mission_status.inspect

    else
      logger.info "Bad!"
    end

    respond_to do |format|
      format.js
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

    respond_to do |format|
      format.js
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

  def search_backup #TODO agrandhi (this should be called search)
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
  
  def search
    @search_tag_id = params[:search_tag_id] #make this input an array
    @id = params[:id]
    @mission_ids = MissionTagMapping.find(:all, :conditions=>{:mission_tag_id => (@id)}, :select=>"DISTINCT mission_id").collect {|x| x.mission_id}
    if @mission_ids.length > 0
      @results = Mission.find(:all, :conditions=> {:id=>(@mission_ids)})
    else
      @results = nil
    end
    @user = get_user
  end

  private
  
  def choose_layout 
    case(action_name)
    when 'search'
      return 'mission_central'
    when 'search_by_tag'
      return 'mission_central'
    when 'explore_world'
      return 'mission_central'  
    when 'world'
      return 'mission_central'  
    when 'world_missions'
      return nil
    else
	  return 'mission_game'
	end
  end 	
end
