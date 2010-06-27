class CreateUnlockablePlants < ActiveRecord::Migration
  def self.up
    create_table :unlockable_plants do |t|
      t.integer "world_mission_id"
      t.integer "plant_template_id", :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :unlockable_plants
  end
end
