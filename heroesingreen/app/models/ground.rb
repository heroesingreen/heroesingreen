class Ground < ActiveRecord::Base
	belongs_to :garden
    has_many :plants
 
  def tick
    self.plants.each{ |plant|
      plant.tick
    }
  end
end
