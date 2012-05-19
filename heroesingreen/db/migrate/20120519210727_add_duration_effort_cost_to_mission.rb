class AddDurationEffortCostToMission < ActiveRecord::Migration
  def self.up
    add_column :missions, :duration, :time
    add_column :missions, :effort, :time
    add_column :missions, :cost, :integer
  end

  def self.down
    remove_column :missions, :cost
    remove_column :missions, :effort
    remove_column :missions, :duration
  end
end
