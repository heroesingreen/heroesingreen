class User < ActiveRecord::Base
  has_many :missionStatuses
  has_many :gardens
  validates_presence_of :email, :password
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && password == user.password
      return user
    end
    nil
  end
  
  def total_points  	
  	total_points = 0
  	all_statuses = self.missionStatuses.find_all_by_status(MissionStatus::COMPLETED_STATUS)
  	all_statuses.each{
  	|status| 
  	total_points += status.mission_points
  	}
  	
  	active_statuses = self.missionStatuses.find_all_by_status(MissionStatus::ACTIVATED_STATUS)
  	active_statuses.each{
  	|status|
  	if status.mission.repeatable?
  		total_points += status.mission_points
  	end
  	}
    return total_points
  end 
  
  def get_garden
  		  
	
  end
  
  def add_garden
  	new_garden = Garden.new
  	self.gardens.push(new_garden)
  	self.save!
    new_garden.save!
    new_garden.initialize_plots
    return new_garden
  end
  	    
end
