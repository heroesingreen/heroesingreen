class UpdatePlants < ActiveRecord::Migration
  def self.up
  	remove_column :plants, :x
  	remove_column :plants, :y
  	remove_column :plants, :plot_id
  	add_column :plants, :ground_id, :integer
  	add_column :plants, :layer_id, :integer
  end

  def self.down
  	add_column :plants, :x, :integer
  	add_column :plants, :y, :integer
  	add_column :plants, :plot_id, :integer
  	remove_column :plants, :ground_id
  	remove_column :plants, :layer_id
  end
end
