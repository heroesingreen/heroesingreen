class Mission < ActiveRecord::Base
	has_many :mission_statuses
	
# => Type information
	ONESHOT_TYPE = 0
	REPEATABLE_TYPE = 1
	EPIC_TYPE = 2
	def oneshot?
		self.repeatable == ONESHOT_TYPE
	end
	
	def repeatable?
		self.repeatable == REPEATABLE_TYPE
	end
	
	def epic?
		self.repeatable == EPIC_TYPE
	end
	
end
