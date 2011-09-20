class MissionTag < ActiveRecord::Base
  has_many :mission_tag_mappings
  has_many :missions, :through => :mission_tag_mappings 
  
  validates_presence_of :mission_tag
  
 attr_accessor :mission_ids
 after_save :update_missions
 
 def update_missions
    unless mission_ids.nil?
      self.mission_tag_mappings.each do |m|
        m.destroy unless mission_ids.include?(m.mission_id.to_s)
        mission_ids.delete(m.mission_id.to_s)
      end
      mission_ids.each do |g|
        self.mission_tag_mappings.create(:mission_id => g) unless g.blank?
      end
      reload
      self.mission_ids = nil
    end
 end
end