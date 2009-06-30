class User < ActiveRecord::Base
  has_many :mision_statuses
  validates_presence_of :email, :password
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      password == user.password
      return user
    end
    nil
  end
  
  def add_mission_status(new_mission_status)
	#TODO
  end
end
