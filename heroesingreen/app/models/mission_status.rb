class MissionStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission
  validates_presence_of :mission_id

# => Status information
  ACTIVATED_STATUS = 1
  COMPLETED_STATUS = 2
  
  def activate!
    self.status = ACTIVATED_STATUS
  end
  
  def activated?
    self.status == ACTIVATED_STATUS
  end
  
  def complete!
    self.status = COMPLETED_STATUS
    if self.mission.repeatable?
    	self.repeats+=1
	end
  end
  
  def completed?
    self.status == COMPLETED_STATUS
  end
  
  def status_string
  	if self.activated?
  		'Active'
  	elsif self.completed?
  		'Completed'
  	else
  		'Unknown'
  	end
  end

# => Mission points calculation 

  def mission_points
  	if self.mission.repeatable?
  		self.repeats * self.mission.points
  	else
  		self.mission.points
  	end
  end
  	
 
  
#  def status
#    @mission_status.status
#  end

end
