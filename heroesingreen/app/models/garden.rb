class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :grounds

  validates_presence_of :user_id
  
  TIME_PER_TICK = 1.day

  @@DEFAULT_SIZE_X = 8
  @@DEFAULT_SIZE_Y = 5

  def self.DEFAULT_SIZE_X
    @@DEFAULT_SIZE_X
  end

  def self.DEFAULT_SIZE_Y
    @@DEFAULT_SIZE_Y
  end

  def set_defaults
    self.default_wetness = 10
    self.default_nutrients = 7
    self.wetness_replenish = 2
    self.nutrients_replenish = 3
    self.size_x = @@DEFAULT_SIZE_X
    self.size_y = @@DEFAULT_SIZE_Y
  end

  def add_plant(plant_id, x, y)
    if(is_compatible(plant_id, x, y))
      found_ground = createGround(x, y)
      
      #need to check if there's a plant like this already here? TODO:agrandhi
      new_plant = PlantTemplate.find(plant_id).createPlant(found_ground)
      new_plant.save!
      return true
    else
      return false
    end
  end
 
  def is_there_a_good_ground(plant_type) 
    #which x and y
    plantableGrounds = [[0,0],[0,1],[0,2],[0,3],[0,4],[1,0],[1,1],[1,2],[1,3],[1,4],[2,0],[2,1],[2,2],[2,3],[2,4],[3,0],[3,1],[3,2],[3,3],[3,4],[4,0],[4,1],[4,2],[4,3],[4,4],[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6],[6,0],[6,1],[6,2],[6,3],[6,4],[7,0],[7,1],[7,2],[7,3],[7,4]]
    
    #find vacant grounds
    vacantGrounds = []
    plantableGrounds.each do |tempG|
      if(self.grounds.find_by_x_and_y(tempG[0],tempG[1]) == nil and tempG[1] >= (6 - plant_type.layer_max))
        vacantGrounds.push(tempG)
      end
    end
    
    #find grounds where this plant won't be blocked by other plants and won't block other plants
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
#        nonblockingGrounds.push(tempG)
         return true
      end
    end
    return false
  end
 
  def is_compatible(plant_template_id, x, y)  #can this plant go into this x and y
    Rails.logger.info "got here 0"
    x = x.to_i
    y = y.to_i
    @plantTemplate = PlantTemplate.find(plant_template_id)
    if @plantTemplate == nil
      return false
    end
    Rails.logger.info "got here 0.1"

    if(self.grounds.find_by_x_and_y(x,y) != nil)
        return false
    end
    Rails.logger.info "got here 0.2"
    return true

    
    if(y < (6 - @plantTemplate.layer_max))
        return false
    end

    Rails.logger.info "got here 1"

    inFrontOfY = y + 1
    while(inFrontOfY < self.size_y)  # check that there are no blocking plants in front of this x,y
    tempGround = self.grounds.find_by_x_and_y(x, inFrontOfY)
    if(tempGround != nil)
      tempGround.plants.each do |p|
      if p.plant_template.shadow_block
        return false
      end
      end
    end
    inFrontOfY = inFrontOfY + 1
    end
    Rails.logger.info "got here 2"
  
    if(@plantTemplate.shadow_block) # check that this is not blocking any plants behind this ground
    behindY = y - 1  
    while(behindY > 3)       # TODO:agrandhi calculate this no. based on plant-able layers and size_y
      tempGround = self.grounds.find_by_x_and_y(x, behindY)
      if(tempGround != nil)
      return false
      end
      behindY = behindY - 1
    end
    end
    Rails.logger.info "got here 3"

    return true
  end

  
  def remove_plant(plant)
    plant.ground.destroy  #TODO Should we call plant.die here? Anything else to be done or just a destroy?
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

  def get_plant_image_url(ground, x, y)
    ground.plants.each do |plant|
      if plant.plant_template.image_path != nil
        img_url = "plants/#{plant.plant_template.image_path}"
        if self.size_y - y == 1
          img_url = img_url + "a.png"
        elsif self.size_y - y == 2
          img_url = img_url + "b.png"
        elsif self.size_y - y == 3
          img_url = img_url + "c.png"
        end
      end
    end
    return img_url
  end

end
