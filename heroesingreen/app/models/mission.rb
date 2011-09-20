class Mission < ActiveRecord::Base
	has_many :mission_statuses
	
  has_many :mission_tag_mappings
  has_many :mission_tags, :through => :mission_tag_mappings 
	
 attr_accessor :mission_tag_ids
 after_save :update_missions_tag
 
 def update_missions_tag
    unless mission_tag_ids.nil?
      self.mission_tag_mappings.each do |m|
        m.destroy unless mission_tag_ids.include?(m.mission_tag_id.to_s)
        mission_tag_ids.delete(m.mission_tag_id.to_s)
      end
      mission_tag_ids.each do |g|
        self.mission_tag_mappings.create(:mission_tag_id => g) unless g.blank?
      end
      reload
      self.mission_tag_ids = nil
    end
 end
	
# => Type information
	ONESHOT_TYPE = 0
	REPEATABLE_TYPE = 1
	EPIC_TYPE = 2
	
	MISSION_TYPE_NAMES = {
	ONESHOT_TYPE=>"Oneshot",
	REPEATABLE_TYPE=>"Repeatable",
	EPIC_TYPE=>"Epic"}
	
	def oneshot?
		self.repeatable == ONESHOT_TYPE
	end
	
	def repeatable?
		self.repeatable == REPEATABLE_TYPE
	end
	
	def epic?
		self.repeatable == EPIC_TYPE
	end
	
	def self.find_all_with_tag(tag)
	  return Mission.find(:all, :conditions=>["tags like '%%#{tag}%%'"])
  end
  
end
