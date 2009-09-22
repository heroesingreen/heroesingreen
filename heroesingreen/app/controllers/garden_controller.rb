class GardenController < ApplicationController
	layout "mission_game"
	
	def index
		redirect_to(:action=>:view)
	end
	
	def view
	  @garden = get_current_garden
	end
end
