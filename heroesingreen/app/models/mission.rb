class Mission < ActiveRecord::Base
	has_many :mission_statuses
	
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
