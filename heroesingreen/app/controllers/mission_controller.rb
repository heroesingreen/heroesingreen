class MissionController < ApplicationController
  def index
    
  end
  
  def start
    all_missions = Mission.all
    @mission = all_missions[rand(all_missions.length)] #Pick a random mission
  end
  
  def accept
  	@mission = Mission.find(params[:id])  	
 end
 
 def complete
   @mission = Mission.find(params[:id])
 end
end
