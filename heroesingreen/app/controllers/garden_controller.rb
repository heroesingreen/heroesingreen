class GardenController < ApplicationController
	layout "mission_game"
	
	def index
		redirect_to(:action=>:view)
	end
	
	def view
	  @garden = get_current_garden
	  @garden.garden_tick
	end
	
	def tick
		@garden  = Garden.find(params[:id])
		repeat=params[:repeat]
		repeat ||= 1
		repeat=repeat.to_i
		@garden.tick(repeat)
		redirect_to(:action=>:view)
	end
	
end
