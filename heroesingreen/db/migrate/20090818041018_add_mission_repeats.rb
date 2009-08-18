class AddMissionRepeats < ActiveRecord::Migration
  def self.up
  	add_column :mission_statuses, :repeats, :integer, :default=>0
  end

  def self.down
  	remove_column :mission_statuses, :repeats
  end
end
