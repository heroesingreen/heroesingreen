class UpdateGardens < ActiveRecord::Migration
  def self.up
  	add_column :gardens, :default_wetness, :integer
  	add_column :gardens, :default_nutrients, :integer
  end

  def self.down
  	remove_column :gardens, :default_wetness
  	remove_column :gardens, :default_nutrients
  end
end
