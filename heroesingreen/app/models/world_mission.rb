class WorldMission < ActiveRecord::Base
  belongs_to :world
  belongs_to :mission
  has_many :plant_templates, :through => :unlockable_plants
  has_many :unlockable_plants

  def get_plants
    self.plant_templates.collect{|plant| plant}
  end
end
