class CreateWorldMissions < ActiveRecord::Migration
  def self.up
    create_table :world_missions do |t|
      t.integer "world_id", :null => false
      t.string  "name", :null => false
      t.string  "description"
      t.integer "mission_id"
      t.string  "tag"
      t.boolean "required", :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :world_missions
  end
end
