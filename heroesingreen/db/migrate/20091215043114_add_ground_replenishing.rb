class AddGroundReplenishing < ActiveRecord::Migration
  def self.up
  	  	add_column :gardens, :nutrients_replenish, :integer
  	  	add_column :gardens, :wetness_replenish, :integer
  end

  def self.down
  		remove_column :gardens, :nutrients_replenish
		remove_column :gardens, :wetness_replenish
  end
end
