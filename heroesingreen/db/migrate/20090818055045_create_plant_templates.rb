class CreatePlantTemplates < ActiveRecord::Migration
  def self.up
    create_table :plant_templates do |t|
      t.string :name
      t.integer :cost
      t.integer :max_health
      t.integer :virility
      t.integer :strength
      t.integer :min_light
      t.integer :shade_generated
      t.integer :min_water
      t.integer :water_consumption
      t.integer :layer_req

      t.timestamps
    end
  end

  def self.down
    drop_table :plant_templates
  end
end
