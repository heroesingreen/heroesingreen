class MissionTagCategoryMapping < ActiveRecord::Base
  belongs_to :mission_tag
  validates_presence_of :mission_tag_id
  validates_presence_of :mission_tag_category_id
end