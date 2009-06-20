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
  end
 
  def complete
    @mission = Mission.find(params[:id])
    @mission_status = find_mission_status
    @mission_status.complete
  end
 
  private
  
  def find_mission_status
    session[:mission_status] ||= Mission_status.new
  end
end
