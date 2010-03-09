class Plant < ActiveRecord::Base
  belongs_to :ground
  belongs_to :plant_template
  
  validates_presence_of :ground_id
  validates_presence_of :plant_template_id
  
  def tick(turns)
    growth_turns = 0
    wither_turns = 0
    
    #Calculate nutrient drain
    nutrients_diff = self.plant_template.nutrients_consumption - self.ground.garden.nutrients_replenish
    nutrients_total_diff = nutrients_diff * turns
    final_nutrients = self.ground.nutrients - nutrients_total_diff
    
    #See if plant made it
    if(final_nutrients <  self.plant_template.nutrients_tolerance)
      #Only grow if ground nutrients was above tolerance for a period of time
      if(self.ground.nutrients > self.plant_template.nutrients_tolerance)
        diff_tolerance_nutrients = self.ground.nutrients - self.plant_template.nutrients_tolerance
        growth_turns = (diff_tolerance_nutrients / nutrients_diff.to_f).round
      end
    else
      growth_turns = turns #Plant was in the black all this time, grow max turns
    end
    
    #Update nutrients
    final_nutrients = 0 if final_nutrients < 0
    self.ground.nutrients = final_nutrients
      
    
    #Calculate wetness drain
    wetness_diff = self.plant_template.water_consumption - self.ground.garden.wetness_replenish
    wetness_total_diff = wetness_diff * turns
    final_wetness = self.ground.wetness - wetness_total_diff
    
    #See if plant made it
    if(final_wetness <  self.plant_template.wetness_tolerance)
      #Only grow if wetness was above tolerance for a period of time
      if(self.ground.wetness > self.plant_template.wetness_tolerance)
        diff_tolerance_wetness = self.ground.wetness - self.plant_template.wetness_tolerance
        wetness_growth_turns = (diff_tolerance_wetness / wetness_diff.to_f).round
      end
      wetness_growth_turns = 0
    else
      wetness_growth_turns = turns #Plant was in the black all this time, grow max turns
    end

    #Update water
    final_wetness = 0 if final_wetness < 0
    self.ground.wetness = final_wetness
        
    #Only take the lesser of the growth turns
    growth_turns = wetness_growth_turns unless (wetness_growth_turns > growth_turns) && growth_turns != 0
      
    #Now calculate dying turns
    wither_turns = turns - growth_turns
    
    grow(growth_turns)
    wither(wither_turns)
    
    if(!self.alive?)
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
  def grow(ticks)
  	## Hard cap the growth of any individual plants at 1000 ticks.
  	self.growth_ticks += ticks
  	self.growth_ticks = 1000 if self.growth_ticks > 1000
  	self.height = self.plant_template.vertical_rate + self.plant_template.vertical_rate*Math.log(self.growth_ticks)
  	self.radius = self.plant_template.radial_rate + self.plant_template.radial_rate*Math.log(self.growth_ticks)
		
		self.health += (0.1 * self.plant_template.health_max * ticks).ceil
    self.health = self.plant_template.health_max if (self.health > self.plant_template.health_max)
  	
  	self.save
  end
  
  def wither(ticks)
  	## Withering needs to be proportional to the plant's total health, otherwise small, fragile plants die horribly while big plants are unphased.
  	## Make it 5% of the total health of the plant, rounded to the nearest integer.
  	self.health -= (0.05 * ticks * self.plant_template.health_max).ceil
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
