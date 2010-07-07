class WorldMission < ActiveRecord::Base
  belongs_to :world
  belongs_to :mission
  has_many :plant_templates, :through => :unlockable_plants
  has_many :unlockable_plants

  def get_plants
    self.plant_templates.collect{|plant| plant}
  end
  
  def unlockable_text
    self.get_plants.collect{|plant| plant.name}.join(", ")
  end
end
