class User < ActiveRecord::Base
  has_many :missionStatuses
  validates_presence_of :email, :password
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      password == user.password
      return user
    end
    nil
  end
  
  def add_mission_status(newMissionStatus)
  	self.missionStatuses.find_or_create_by_mission_id(newMissionStatus.mission.id)
  end
end
