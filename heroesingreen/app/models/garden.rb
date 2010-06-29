class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :grounds
  
  validates_presence_of :user_id
  
  TIME_PER_TICK = 1.day
  
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
    plantableGrounds = [[0,4],[0,5],[0,6],[1,4],[1,5],[1,6],[2,4],[2,5],[2,6],[3,4],[3,5],[3,6],[4,4],[4,5],[4,6],[5,4],[5,5],[5,6],[6,4],[6,5],[6,6],[7,4],[7,5],[7,6]]
    vacantGrounds = []
    plantableGrounds.each do |tempG|
      if(self.grounds.find_by_x_and_y(tempG[0],tempG[1]) == nil and tempG[1] >= (6 - plant_type.layer_max))
        vacantGrounds.push(tempG)
      end
    end
    
    nonblockingGrounds = []
    
    vacantGrounds.each do |tempG|
      nothingInFront = true 
      nothingBehind = true
      x = tempG[0]
      y = tempG[1]
      inFrontOfY = y + 1
      while(inFrontOfY < self.size_y)  # check that there are no blocking plants in front of this x,y
        tempGround = self.grounds.find_by_x_and_y(x, inFrontOfY)
        if(tempGround != nil)
          tempGround.plants.each do |p|
            if p.plant_template.shadow_block
              nothingInFront = false
              break
            end
          end
        end
        break unless nothingInFront
        inFrontOfY = inFrontOfY + 1
      end

      if(plant_type.shadow_block) # check that this is not blocking any plants behind this ground
        behindY = y - 1  
        while(behindY > 3)       # TODO:agrandhi calculate this no. based on plant-able layers and size_y
          tempGround = self.grounds.find_by_x_and_y(x, behindY)
          if(tempGround != nil)
            nothingBehind = false
            break
          end
          behindY = behindY - 1
        end
      end
      
      if(nothingInFront and nothingBehind) 
        nonblockingGrounds.push(tempG)
      end
    end
  
    numGoodGrounds = nonblockingGrounds.length
    if(numGoodGrounds > 0)
      chosenGround = nonblockingGrounds[rand(numGoodGrounds)]
      found_ground = createGround(chosenGround[0], chosenGround[1])
      
      #need to check if there's a plant like this already here?
      new_plant = plant_type.createPlant(found_ground)
      new_plant.save!
      return true
    else
      return false
    end
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
    ticks_since_last = (since_last_update/TIME_PER_TICK).to_i
    tick(ticks_since_last)
  end

  def tick(times)
    if times > 0
      self.grounds.each{ |ground|
        ground.tick(times)
      }
    end
    self.updated_at=Time.now #TODO - use something other than updated_at
    self.save
  end
end
