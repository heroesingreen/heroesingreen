class User < ActiveRecord::Base
  has_many :missionStatuses
  has_many :gardens
  validates_presence_of :email, :password
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      password == user.password
      return user
    end
    nil
  end
  
  def total_points
  	all_statuses = self.missionStatuses.find_all_by_status(MissionStatus::COMPLETED_STATUS)
  	total_points = 0
  	all_statuses.each{
  	|status| 
  	total_points += status.mission_points
  	}
  	total_points  		
  end 
end
