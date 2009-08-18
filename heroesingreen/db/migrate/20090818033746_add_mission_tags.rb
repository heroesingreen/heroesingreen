class AddMissionTags < ActiveRecord::Migration
  def self.up
  	add_column :missions, :tags, :string  	
  end

  def self.down
  	remove_column :missions, :tags
  end
end
