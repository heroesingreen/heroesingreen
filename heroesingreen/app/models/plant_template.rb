class PlantTemplate < ActiveRecord::Base
  has_many :plants
  
  def createPlant(ground)
    Plant.new(:ground=>ground,:plant_template=>self,:health=>self.health_max)
  end

end
