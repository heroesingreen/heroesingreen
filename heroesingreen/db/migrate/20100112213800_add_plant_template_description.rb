class AddPlantTemplateDescription < ActiveRecord::Migration
  def self.up
    add_column :plant_templates, :description, :string
  end

  def self.down
    remove_column :plant_templates, :description
  end
end
