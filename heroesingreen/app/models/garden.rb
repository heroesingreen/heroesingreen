class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :grounds
  
  validates_presence_of :user_id
  
  def set_defaults
  	self.default_wetness = 5
  	self.default_nutrients = 5
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
  		
  def createGround(x,y)
    new_ground = Ground.new(:garden=>self,:x=>x,:y=>y,:wetness=>self.default_wetness,:nutrients=>self.default_nutrients)
    new_ground.save!
    return new_ground
  end
  
  # how to set garden defaults?
  
  def garden_grow(points)
  end
 	

  def tick(repeat)
  	repeat.times
  	{
    	self.grounds.each{ |ground|
      		ground.tick    }
  	}
  end
  
end
