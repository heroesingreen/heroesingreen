class Plant < ActiveRecord::Base
  belongs_to :ground
  belongs_to :plant_template
  
  validates_presence_of :ground_id
  validates_presence_of :plant_template_id
  
  def tick
  	if self.ground.consume_water(self.plant_template.water_consumption) && self.ground.consume_nutrients(self.plant_template.nutrients_consumption)
  	then
  		self.grow
  	else 
  		self.wither
  	end
  	if (self.fertile?) then
  		self.reproduce
  	end
    if (!self.alive?)
      self.die
    end
    self.save!
  end  
 
  ## What state the plant is in
  
  def alive?
    health > 0
  end
    
  def fertile?
  	## Nourished shouldn't be a precondition, and need to go back and add a plant specific fertility threshold - for now just hardcoding at 80%.
  	if growth_ticks > 10 && health > (self.plant_template.health_max*0.8)
  		return true
  	else
  		return false
  	end  	
  end
  
  ## Actions the plant can take
  def grow
  	self.growth_ticks += 1
  	self.height = self.plant_template.vertical_rate + self.plant_template.vertical_rate*Math.log(self.growth_ticks)
  	self.radius = self.plant_template.radial_rate + self.plant_template.radial_rate*Math.log(self.growth_ticks)
  	if health < self.plant_template.health_max
  		self.health += 1
  	end
  	self.save
  end
  
  def wither
  	self.health -= 5 
  	self.save	
  	## Need physical withering effects (slower than growth)
  end  
  
  def reproduce
    
  end
  
  def die
  	## Need to make it so dead plants add their nutrients back into the soil
  	self.destroy
  end
 
  def name
    self.plant_template.name
  end
  
  def cost
    self.plant_template.cost
  end
end
