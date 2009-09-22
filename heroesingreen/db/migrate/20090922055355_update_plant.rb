class UpdatePlant < ActiveRecord::Migration
  def self.up
     #####FIELDS AVAILABLE######
     # plant_template_id, int
     # plot_id, int
     # health, int
     # x, int
     # y, int
     # height, int
     # radius, int
     ###########################
     
    add_column :plants, :height, :integer
    add_column :plants, :radius, :integer
  end

  def self.down
    remove_column :plants, :height
    remove_column :plants, :radius
  end
end
