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
  		logged_in_user = get_user(session[:user_id])
  		if(logged_in_user)
  			unless(params[:id]!=nil)
    			#plant_template id not found
    			redirect_to(:action=>:view)    			
    		return
    		end
    		@plant_template = PlantTemplate.find(params[:id])
  			get_current_garden.add_plant(@plant_template)
  			flash[:notice] = @plant_template.name + " has successfully been purchased!"
  			redirect_to(:action=>:view)
    	else
    		flash[:notice] = "Please log in to purchase plants!"
   			redirect_to(:controller=>:store, :action=>:view)
    		return    
    	end
   	end
      
end
