class AddingAvailPointsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :available_points, :integer, :default => 0
  end

  def self.down
    remove_column :users, :available_points
  end
end
