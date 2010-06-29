class AddPlantBlockingBool < ActiveRecord::Migration
  def self.up
    add_column :plant_templates, :shadow_block, :boolean, :default => 0
  end

  def self.down
    remove_column :plant_templates, :shadow_block
  end
end
