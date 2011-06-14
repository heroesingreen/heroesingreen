class MissionTag < ActiveRecord::Base
  has_many :mission_tag_mappings
  has_many :missions, :through => :mission_tag_mappings 
  
  validates_presence_of :mission_tag
end