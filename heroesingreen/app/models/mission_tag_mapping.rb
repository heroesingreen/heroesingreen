class MissionTagMapping < ActiveRecord::Base
  belongs_to :mission # foreign key - mission_id
  belongs_to :mission_tag # foreign key - mission_tag_id
  validates_presence_of :mission_id
  validates_presence_of :mission_tag_id 
end