class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :plots
  
  validates_presence_of :user_id
  
  def initialize_plots
    self.plots.push(Plot.new(:layer_id => Plot::GRASS_LAYER))
    self.plots.push(Plot.new(:layer_id => Plot::SHRUB_LAYER))
    self.plots.push(Plot.new(:layer_id =>Plot::SMALL_TREE_LAYER))
    
    self.save!
    
    self.plots.each{|plot|	plot.save!}
  end
  
  def add_plant(plant_type)
    found_plot = self.plots.find_by_layer_id(plant_type.layer_max)
    unless(found_plot==nil) then
      new_plant = plant_type.createPlant(found_plot)
      found_plot.place_plant(new_plant)
      new_plant.save!
      return true   
    end
    false #Failed to add plant
  end
  
  def tick
    self.plots.each{ |plot|
      plot.tick
    }
  end
  
  def garden_grow(points)
  end
  
end
