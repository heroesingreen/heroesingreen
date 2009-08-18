class Mission < ActiveRecord::Base
	has_many :mission_statuses
	
# => Type information
	ONESHOT_TYPE = 0
	REPEATABLE_TYPE = 1
	EPIC_TYPE = 2
	def oneshot?
		self.type == ONESHOT_TYPE
	end
	
	def repeatable?
		self.type == REPEATABLE_TYPE
	end
	
	def epic?
		self.type == EPIC_TYPE
	end
	
end
