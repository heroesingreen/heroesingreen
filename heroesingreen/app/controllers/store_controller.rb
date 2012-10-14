class StoreController < ApplicationController
		
	layout "store"
  
  def index
    redirect_to(:action=>:view)
  end
  
  def view
    if(params[:admin_ticks])
      @render_admin = true
    end
    
    @garden = get_current_garden
    @garden.garden_tick
    @logged_in_user = get_user
    @plant_templates = PlantTemplate.all
      
      respond_to do |format|
          format.html 
          format.xml  { render :xml => @plant_templates}
      end
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
  
  def buy
   @logged_in_user = get_user
    
    #try to buy if user is logged in        
    if(@logged_in_user)
      if(params[:id]==nil)
        #plant_template id not found
        redirect_to(:action=>:view)         
        return
      end
          
      @plant_template = PlantTemplate.find(params[:id])
      if(@plant_template != nil)
        @user_can_buy = @logged_in_user.avail_points >= @plant_template.cost
            
        if @user_can_buy
#          if(get_current_garden.add_plant(@plant_template))
#            @logged_in_user.pay(@plant_template.cost)
#            flash[:notice] = @plant_template.name + " has successfully been purchased!"
#            redirect_to(:controller=>:garden, :action=>:view)  

           if(get_current_garden.is_there_a_good_ground(@plant_template))
               flash[:notice] = "Click on a highlighted garden area to place the " + @plant_template.name + " there"
               redirect_to(:controller=>:garden, :action=>:view, :pl=>@plant_template.id)
           else
              flash[:notice] = "No room for plant " + @plant_template.name + " in your garden"
              redirect_to(:controller=>:store, :action=>:view)
           end
        else
          flash[:notice] = "Not enough points to purchase " + @plant_template.name
          redirect_to(:controller=>:store, :action=>:view)
        end
        
      end
    
    #should we redirect to login/register page?
    else
      flash[:notice] = "Please log in to purchase plants!"
      redirect_to(:controller=>:store, :action=>:view)    
    end
  end 
  
  def buyAndSave
      @plantId = params[:id]
      @x = params[:x]
      @y = params[:y]
      @plant_template = PlantTemplate.find(@plantId)
   
      @logged_in_user = get_user
      if(!@logged_in_user)
          flash[:notice] = "Please log in to purchase plants!"
          redirect_to(:controller=>:store, :action=>:view)
      end
       
      if(@plant_template != nil and @x != nil and @y != nil )
          if(@logged_in_user.avail_points >= @plant_template.cost)
              if(get_current_garden.add_plant(@plantId, @x, @y))
                  @logged_in_user.pay(@plant_template.cost)
                  flash[:notice] = @plant_template.name + " has successfully been purchased!"
                  redirect_to(:controller=>:garden, :action=>:view)
              else
                  flash[:notice] = @plant_template.name + " cannot be planted in this ground."
                  redirect_to(:controller=>:garden, :action=>:view)
              end
          else
              flash[:notice] = "Not enough points to purchase " + @plant_template.name
              redirect_to(:controller=>:store, :action=>:view)
          end
      else
          flash[:notice] = "You're trying to buy an invalid plant."
          redirect_to(:controller=>:store, :action=>:view)
      end
  end
  
end