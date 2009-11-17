class User < ActiveRecord::Base
  has_many :missionStatuses
  has_many :gardens
  validates_presence_of :email, :password
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && password == user.password
      return user
    end
    nil
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
        
end
