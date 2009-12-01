class StoreController < ApplicationController
	
	layout "mission_game"
	
	def view
  		@plant_templates = PlantTemplate.all
  		
  		respond_to do |format|
      		format.html 
      		format.xml  { render :xml => @plant_templates}
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
          get_current_garden.add_plant(@plant_template)
          @logged_in_user.pay(@plant_template.cost)
          flash[:notice] = @plant_template.name + " has successfully been purchased!"
          redirect_to(:controller=>:garden, :action=>:view)  
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
  
end
