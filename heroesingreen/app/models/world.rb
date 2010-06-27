class World < ActiveRecord::Base
  has_many :world_missions 
  
  def unlockable_plants
    plants = []
    self.world_missions.each{|mission| plants.concat(mission.get_plants)}
  end
  
  def unlockable_text
    self.unlockable_plants.collect{|plant| plant.name}.join(",")
  end
end
