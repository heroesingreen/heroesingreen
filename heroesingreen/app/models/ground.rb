class Ground < ActiveRecord::Base
  belongs_to :garden
  has_many :plants, :dependent => :destroy

  validates_presence_of :wetness, :nutrients

  def tick(times)
    self.plants.each{ |plant|
      plant.tick(times)
    }
    self.save
  end
  
  def replenish(times)
  	## This function should vary by the type of ecosystem, but for now it's constant. (add a ground template? or a garden property?)
  	## 
  	max_wetness = 2*self.garden.default_wetness
  	
  	if self.wetness < max_wetness
  	  self.wetness += self.garden.wetness_replenish * times
  	  if(self.wetness > max_wetness)
  	    self.wetness = max_wetness
  		end
  	end
  	
  	max_nutrients = 2*self.garden.default_nutrients
  	
  	if self.nutrients < max_nutrients
  		self.nutrients += self.garden.nutrients_replenish * times
  		if(self.nutrients > max_nutrients)
  	    self.nutrients = max_nutrients
  		end
  	end
  end
  
  def consume_water(amount)
  	self.wetness -= amount
  	if self.wetness < 0
  		self.wetness = 0
  		success = false
  	else
  		success = true	
  	end
  	self.save
  	return success
  end
  
  def consume_nutrients(amount)
  	self.nutrients -= amount
  	if self.nutrients < 0
  		self.nutrients = 0
  		success = false
  	else
  		success = true
    end
    self.save
    return success
  end
 
  def shade
  	## This should be determined by the plants. But that's hard.
  	shade = 0
  	return shade  	
  end
  	
end
