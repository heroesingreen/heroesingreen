class ChangeMissionsUnitpointsToFloat < ActiveRecord::Migration
  def self.up
    change_column :missions, :unitPoints, :float
    change_column :missions, :cost, :decimal
  end

  def self.down
    change_column :missions, :unitPoints, :integer
    change_column :missions, :cost, :integer, :precision => 10, :scale => 2
  end
end
