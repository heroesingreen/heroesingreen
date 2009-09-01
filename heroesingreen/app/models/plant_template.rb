class PlantTemplate < ActiveRecord::Base
  has_many :plants
  
  def createPlant(plot)
    Plant.new(:plot=>plot,:plant_template=>self,:health=>self.max_health)
  end
end