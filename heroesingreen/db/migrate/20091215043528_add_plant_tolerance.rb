class AddPlantTolerance < ActiveRecord::Migration
  def self.up
  	add_column :plant_templates, :nutrients_tolerance, :integer
  	add_column :plant_templates, :wetness_tolerance, :integer
  	add_column :plant_templates, :nutrients_optimum, :integer
  	add_column :plant_templates, :wetness_optimum, :integer
  	remove_column :plant_templates, :water_min
  	remove_column :plant_templates, :nutrients_min
  	remove_column :plant_templates, :water_max
  	remove_column :plant_templates, :nutrients_max  	
  end

  def self.down
  	remove_column :plant_templates, :nutrients_tolerance
  	remove_column :plant_templates, :wetness_tolerance
  	remove_column :plant_templates, :nutrients_optimum
  	remove_column :plant_templates, :wetness_optimum
  	add_column :plant_templates, :water_min, :integer
  	add_column :plant_templates, :nutrients_min, :integer
  	add_column :plant_templates, :water_max, :integer
  	add_column :plant_templates, :nutrients_max, :integer
  	
  end
end
