class AddGrowthTicks < ActiveRecord::Migration
  def self.up
  	add_column :plants, :growth_ticks, :integer
  end

  def self.down
  	remove_column :plants, :growth_ticks
  end
end
