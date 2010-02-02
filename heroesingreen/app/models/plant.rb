class Plant < ActiveRecord::Base
  belongs_to :ground
  belongs_to :plant_template
  
  validates_presence_of :ground_id
  validates_presence_of :plant_template_id
  
  def tick
  	## Have the plant 'eat' and 'drink'. Also make sure it isn't drowning (cactus in a rainforest). If everything is good, go ahead and grow.

  	shouldgrow = ((self.ground.wetness - self.plant_template.wetness_optimum).abs < self.plant_template.wetness_tolerance)
  	shouldgrow &= ((self.ground.nutrients - self.plant_template.nutrients_optimum).abs < self.plant_template.nutrients_tolerance)
	shouldgrow = self.ground.consume_water(self.plant_template.water_consumption) && shouldgrow
  	shouldgrow = self.ground.consume_nutrients(self.plant_template.nutrients_consumption) && shouldgrow

  	if shouldgrow
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
  end  
 
  ## What state the plant is in
  
  def alive?
    health > 0
  end
    
  def fertile?
  	## Nourished shouldn't be a precondition, and need to go back and add a plant specific fertility threshold - for now just hardcoding at 80%.
  	if growth_ticks > 100 && health > (self.plant_template.health_max*0.8)
  		return true
  	else
  		return false
  	end 	 
  end
  
  ## Actions the plant can take
  def grow
  	## Hard cap the growth of any individual plants at 1000 ticks.
  	if self.growth_ticks < 1000
  		self.growth_ticks += 1
  		self.height = self.plant_template.vertical_rate + self.plant_template.vertical_rate*Math.log(self.growth_ticks)
  		self.radius = self.plant_template.radial_rate + self.plant_template.radial_rate*Math.log(self.growth_ticks)
  	end
  	if health < self.plant_template.health_max
  		# How much health should be healed when growing? Need to balance with the health lost when withering.
  		self.health += (0.1 * self.plant_template.health_max).ceil
  	end
  	self.save
  end
  
  def wither
  	## Withering needs to be proportional to the plant's total health, otherwise small, fragile plants die horribly while big plants are unphased.
  	## Make it 5% of the total health of the plant, rounded to the nearest integer.
  	self.health -= (0.05 * self.plant_template.health_max).ceil
  	self.save	
  	## Need physical withering effects (slower than growth)
  	
  end  
  
  def reproduce
    
  end
  
  def die
  	## Now plants just dump half the total nutrients they absorbed in their lifetime back into the soil immediately on death.
  	## Add some kind of time decay?
  	self.ground.nutrients += 0.5 * (self.growth_ticks * self.plant_template.nutrients_consumption)
  	self.destroy
  end
 
  def name
    self.plant_template.name
  end
  
  def cost
    self.plant_template.cost
  end
end
