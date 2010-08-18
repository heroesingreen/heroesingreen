class WorldMission < ActiveRecord::Base
  belongs_to :world
  belongs_to :mission
  has_many :plant_templates, :through => :unlockable_plants
  has_many :unlockable_plants

  def get_unlock_missions
    unlock_missions = []
    
    unlock_missions << self.mission if self.mission
    unlock_missions.concat(Mission.find_all_with_tag(self.tag)) if self.tag
    
    return unlock_missions
  end

  def get_plants
    self.plant_templates.collect{|plant| plant}
  end
  
  def unlockable_text
    self.get_plants.collect{|plant| plant.name}.join(", ")
  end
end
