class MissionStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission
  validates_presence_of :mission_id

# => Status information

  ACTIVATED_STATUS = 1
  COMPLETED_STATUS = 2
  DEACTIVATED_STATUS = 3
  
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

  def drop!
  	if (self.mission.repeatable? && self.repeats > 0)
  		self.status = COMPLETED_STATUS
  	else
  		self.status = DEACTIVATED_STATUS
  	end
  end
  
  def deactivated?
  	self.status == DEACTIVATED_STATUS
  end
  	 
  
  def status_string
  	if self.activated?
  		'Active'
  	elsif self.completed?
  		'Completed'
  	elsif self.deactivated?
  		'Inactive'
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

  # Return the time elapsed since this mission was started
  def time_elapsed
    Time.now - created_at
  end

  # Return the time remaining to complete the mission
  # If there is no duration set on the mission, return nil
  def time_remaining
    if mission.timed_mission?
      Rails.logger.info time_elapsed.inspect
      Rails.logger.info mission[:duration].inspect
      time_elapsed - mission[:duration]
    else
      nil
    end
  end

end
