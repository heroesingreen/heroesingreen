class UpdatePlantTemplate < ActiveRecord::Migration
  def self.up
    remove_column :plant_templates, :strength
    remove_column :plant_templates, :shade_generated
    
    
    #####FIELDS AVAILABLE######
    # name - string
    # cost - int
    # virility - int
    # image_path - string
    # layer_max - int
    # health_max - int
    #
    # water_min - int
    # water_max - int
    # water_consumption - int
    #
    # light_min - int
    # light_max - int
    #
    # nutrients_min - int
    # nutrients_max - int
    # nutrients_consumption - int
    #
    # vertical_rate - float
    # radial_rate - float
    # density_rate - float
    #############################
    
    #Copying other field names here for convenience
    
    #t.string :name
    #t.integer :cost
    #t.integer :virility
    add_column :plant_templates, :image_path, :string
    rename_column :plant_templates, :layer_req, :layer_max #integer
    rename_column :plant_templates, :max_health, :health_max #integer
    
    rename_column :plant_templates, :min_water, :water_min #integer    
    add_column :plant_templates, :water_max, :integer
    #t.integer :water_consumption
    
    rename_column :plant_templates, :min_light, :light_min #integer    
    add_column :plant_templates, :light_max, :integer
    
    add_column :plant_templates, :nutrients_min, :integer    
    add_column :plant_templates, :nutrients_max, :integer
    add_column :plant_templates, :nutrients_consumption, :integer
    
    add_column :plant_templates, :vertical_rate, :float
    add_column :plant_templates, :radial_rate, :float
    add_column :plant_templates, :density_rate, :float
  end

  def self.down
    add_column :plant_templates, :strength, :integer
    add_column :plant_templates, :shade_generated, :integer
    remove_column :plant_templates, :image_path
    rename_column :plant_templates, :layer_max, :layer_req 
    rename_column :plant_templates, :health_max, :max_health  
    rename_column :plant_templates, :water_min, :min_water  
    remove_column :plant_templates, :water_max
    rename_column :plant_templates, :light_min, :min_light     
    remove_column :plant_templates, :light_max
    remove_column :plant_templates, :nutrients_min    
    remove_column :plant_templates, :nutrients_max
    remove_column :plant_templates, :nutrients_consumption
    remove_column :plant_templates, :vertical_rate
    remove_column :plant_templates, :radial_rate
    remove_column :plant_templates, :density_rate
  end
end