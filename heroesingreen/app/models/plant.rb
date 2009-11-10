class Plant < ActiveRecord::Base
  belongs_to :ground
  belongs_to :plant_template
  
  validates_presence_of :ground_id
  validates_presence_of :plant_template_id
  
  def tick
  	if (self.alive?) then
  		if(self.nourished?) then
  			self.grow
  		else 
  			self.wither
  		end
  		if (self.fertile?) then
  			self.reproduce
  		end
    else
      self.die
    end
    self.save!
  end  
 
  ## What state the plant is in
  
  def alive?
    health > 0
  end
  
  def nourished?
  	if self.ground.wetness >= self.plant_template.water_min and self.ground.nutrients >= self.plant_template.nutrients_min
  		return true
  	else
  		return false
  	end
  end
  
  def fertile?
  	## Nourished shouldn't be a precondition, and need to go back and add a plant specific fertility threshold - for now just hardcoding at 80%.
  	if self.nourished? and health > (self.plant_template.health_max*0.8)
  		return true
  	else
  		return false
  	end  	
  end
  
  ## Actions the plant can take
  def grow
  	self.height += self.plant_template.vertical_rate
  	self.radius += self.plant_template.radial_rate
  	if health < self.plant_template.health_max
  		self.health += 1
  	end
  	self.ground.nutrients -= self.plant_template.nutrients_consumption
  	self.ground.wetness -= self.plant_template.water_consumption
  	self.ground.save
  	self.save
  end
  
  def wither
  	self.health -= 10 
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
