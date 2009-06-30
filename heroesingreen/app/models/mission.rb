class Mission < ActiveRecord::Base
	has_many :mission_statuses
end
