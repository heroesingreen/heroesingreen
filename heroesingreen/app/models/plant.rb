class Plant < ActiveRecord::Base
  belongs_to :plot
  belongs_to :plant_template
  
  validates_presence_of :plot_id
  validates_presence_of :plant_template_id
  
  def tick
    self.grow
    if(self.alive?) then
      self.reproduce
    else
      self.destroy!
    end
    self.save!
  end
  
  def grow
    
  end
  
  def alive?
    health > 0
  end
  
  def reproduce
    
  end
end
