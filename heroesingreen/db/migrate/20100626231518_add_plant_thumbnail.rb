class AddPlantThumbnail < ActiveRecord::Migration
  def self.up
    add_column :plant_templates, :thumbnail, :string
  end

  def self.down
    remove_column :plant_templates, :thumbnail
  end
end

