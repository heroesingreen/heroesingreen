class Plot < ActiveRecord::Base
  belongs_to :garden
  has_many :plants
  
  validates_presence_of :layer_id
  
  #Layer types
  GRASS_LAYER = 0
  SHRUB_LAYER = 1
  SMALL_TREE_LAYER = 2
  
  #Accessors
  def is_grass_layer?
    self.layer_id == GRASS_LAYER
  end
  
  def is_shrub_layer?
    self.layer_id == SHRUB_LAYER
  end
  
  def is_small_tree_layer?
    self.layer_id == SMALL_TREE_LAYER
  end
  
  #Helpers
  
  #Places the plant somewhere on the plot
  #TODO: Make it not overwrite existing position
  def place_plant(new_plant)
    new_plant.x = rand(self.garden.size_x)
    new_plant.y = rand(self.garden.size_y)
  end
  
  def tick
    self.plants.each{ |plant|
      plant.tick
    }
  end
end
