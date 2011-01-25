class MissionTagMapping < ActiveRecord::Base
  belongs_to :mission
  validates_presence_of :mission_id
  validates_presence_of :mission_tag_id
end