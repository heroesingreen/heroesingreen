class StoreController < ApplicationController
	
	def view
  		@plant_templates = PlantTemplate.all
  		
  		respond_to do |format|
      		format.html 
      		format.xml  { render :xml => @plant_templates}
    	end
  	end
  	
  	def buy
  		user_id = session[:user_id]
  		@user = User.find(user_id)
  		unless(params[:id]!=nil)
    		#plant_template id not found
    		redirect_to(:action=>:view)
    	return
    	end    
  		@plant_template = PlantTemplate.find(params[:id])
  		get_current_garden.add_plant(@plant_template)
   	end



    
end
