class ChangeMissionType < ActiveRecord::Migration
  def self.up
  	rename_column :missions, :type, :repeatable
  end

  def self.down
  	rename_column :missions, :repeatable, :type
  end
end
