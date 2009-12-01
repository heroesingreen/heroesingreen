class PlantTemplate < ActiveRecord::Base
  has_many :plants
  
  def createPlant(ground)
    Plant.new(:ground=>ground,:plant_template=>self,:health=>self.health_max,:height=>self.vertical_rate,:radius=>self.radial_rate, :growth_ticks=>0)
  end

end
