class User < ActiveRecord::Base
  require 'digest/sha1'
  
  has_many :missionStatuses
  has_many :gardens
  validates_presence_of :email
  validates_uniqueness_of :email

  attr_accessor :password_confirmation
  validates_confirmation_of :password
  
  MIN_PASSWORD_LENGTH = 4
    
  SECURITY_ROLES = {:user => 0,
                    :admin => 1}
                    
  SECURITY_ROLES_INVERT = SECURITY_ROLES.invert
    
  def validate
    errors.add_to_base("Password is missing") if hashed_password.blank?
    if(@password_changed)
      errors.add_to_base("Password must be at least #{MIN_PASSWORD_LENGTH} characters") if (!@password || @password.length < MIN_PASSWORD_LENGTH)
    end
  end
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.encrypted_password(password) == user.hashed_password
      return user
    end
    nil
  end
  
  def password
    @password
  end
  
  def password=(new_password)
    @password_changed = true
    @password = new_password
    #Generate salt
    self.salt = self.object_id.to_s + rand.to_s
    self.hashed_password = encrypted_password(new_password)
    self.save
  end
  
  def encrypted_password(password)
    Digest::SHA1.hexdigest("#{password}1337#{self.salt}")
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

  def avail_points  	
    return self.available_points
  end

  def totl_points
    return self.total_points
  end
  
  def add_points(points)
    self.total_points += points
    self.available_points += points
    self.save!
  end
  
  def pay(points)
    self.available_points -= points
    self.save!
  end
  
  def add_garden
  	new_garden = Garden.new
  	self.gardens.push(new_garden)
  	self.save!
  	new_garden.set_defaults
    new_garden.save!
    return new_garden
  end
        
  def security_role=(new_role)
    self.role = SECURITY_ROLES[new_role]
  end
        
  def security_role
    return SECURITY_ROLES_INVERT[self.role]
  end
  
  def admin
    return SECURITY_ROLES_INVERT[self.role] == :admin
  end
  
  def admin=(adminBool)
    self.role = adminBool ? SECURITY_ROLES[:admin] : SECURITY_ROLES[:user]
  end
end
