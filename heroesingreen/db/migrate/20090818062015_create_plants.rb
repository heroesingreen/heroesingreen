class CreatePlants < ActiveRecord::Migration
  def self.up
    create_table :plants do |t|
      t.integer :plant_template_id
      t.integer :plot_id
      t.integer :health
      t.integer :x
      t.integer :y      

      t.timestamps
    end
  end

  def self.down
    drop_table :plants
  end
end
