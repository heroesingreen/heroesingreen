class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :grounds
  
  validates_presence_of :user_id
  
  def set_defaults
  	self.default_wetness = 10
  	self.default_nutrients = 7
  	self.wetness_replenish = 2
  	self.nutrients_replenish = 3
  	self.size_x = 5
  	self.size_y = 5	
  end
  
  def add_plant(plant_type)
  	#which x and y
  	x = rand(self.size_x)
  	y = rand(self.size_y)
  	found_ground = self.grounds.find_by_x_and_y(x,y)
  	if (found_ground == nil)
  		found_ground = createGround(x,y)
  	end
  	#need to check if there's a plant like this already here?
  	new_plant = plant_type.createPlant(found_ground)
  	new_plant.save!
  end
 
  def remove_plant(plant)
    plant.destroy  #TODO Should we call plant.die here? Anything else to be done or just a destroy?
  end
 
  		
  def createGround(x,y)
    new_ground = Ground.new(:garden=>self,:x=>x,:y=>y,:wetness=>(self.default_wetness),:nutrients=>(self.default_nutrients))
    new_ground.save!
    return new_ground
  end
  
  # how to set garden defaults?
  
  def garden_grow(points)
  end

  def garden_tick
  	since_last_update = Time.now - self.updated_at
  	ticks_since_last = since_last_update/time_per_tick
  	ticks_since_last = ticks_since_last.to_i
  	tick(ticks_since_last)
  end

  def tick(repeat)
  	if repeat > 0
  		repeat.times{
    		self.grounds.each{ |ground|
 			ground.tick }
	  	}
	  	self.updated_at=Time.now
	  	self.save
  	end
  		
  end
  
  def time_per_tick
  	time_per_tck = 24*60*60  #1 day
  	return time_per_tck
  end
  
end
