class Ground < ActiveRecord::Base
	belongs_to :garden
    has_many :plants
 
  def tick
  	self.replenish
    self.plants.each{ |plant|
      plant.tick
    }
    self.save
  end
  
  def replenish
  	## This function should vary by the type of ecosystem, but for now it's constant. (add a ground template? or a garden property?)
  	self.wetness += 1
  	self.nutrients += 1  	
  end
  
  def shade
  	## This should be determined by the plants. But that's hard.
  	shade = 0
  	return shade  	
  end
  	
end
