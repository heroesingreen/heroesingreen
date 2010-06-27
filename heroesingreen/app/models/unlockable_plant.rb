class UnlockablePlant < ActiveRecord::Base
  belongs_to :plant_template
  belongs_to :world_mission
  
end
