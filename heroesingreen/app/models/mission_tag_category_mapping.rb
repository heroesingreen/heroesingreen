class MissionTagCategoryMapping < ActiveRecord::Base
  belongs_to :mission_tag
  validates_presence_of :mission_tag_id
  validates_presence_of :mission_tag_category_id
  attr_accessible :mission_tag_id, :mission_tag_category_id

  # TODO: def of all missions in a catagory
  def get_missions_in_cat
    missions = []
    
    return missions
  end
  
  # TODO: def of all catagories that a mission has

  def get_catagories_for_mission
    catagories = []

    unlock_missions << self.mission if self.mission
    unlock_missions.concat(Mission.find_all_with_tag(self.tag)) if self.tag
    
    return catagories
  end

end