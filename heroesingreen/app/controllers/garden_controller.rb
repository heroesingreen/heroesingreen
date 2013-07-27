class GardenController < ApplicationController
  before_filter :authenticate_user!
#  before_filter :ensure_user
  
  layout "garden"
  
  def index
    redirect_to(:action=>:view)
  end
  
  def view
    if(params[:admin_ticks])
      @render_admin = true
    end
    
    @completed_missions = get_user.missionStatuses.find(:all, :conditions=>["status = ?", MissionStatus::COMPLETED_STATUS])
    @garden = get_current_garden
#   @garden.garden_tick
    @logged_in_user = get_user
  end
  
  def tick
    @garden  = Garden.find(params[:id])
    repeat=params[:repeat]
    repeat ||= 1
    repeat=repeat.to_i
    @garden.tick(repeat)
    redirect_to(:action=>:view)
  end

  def remove_plant
    @plant = Plant.find(params[:plant_id])
    @logged_in_user = get_user

    #user is logged in
    if(@logged_in_user)

     if(@plant == nil)
       flash[:notice] = "Unable to find the plant!"
       redirect_to(:action=>:view)
       return
     end

     @plant_template = @plant.plant_template

     if(@plant_template != nil)
      get_current_garden.remove_plant(@plant)
      @logged_in_user.add_to_available_points(@plant_template.cost)
      flash[:notice] = @plant_template.name + " has successfully been removed!"
      redirect_to(:action=>:view)
     end

    #user is not logged in
    else
      flash[:notice] = "Please log in to be able to remove plants!"
      redirect_to(:action=>:view) #TODO go to the right place
    end

  end
end
