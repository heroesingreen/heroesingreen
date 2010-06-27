class CreateWorlds < ActiveRecord::Migration
  def self.up
    create_table :worlds do |t|
      t.string "name", :null => false
      t.string "description", :null => false
      t.string "map_image", :null => false
      t.integer "prequisite_world_id"
      t.timestamps
    end
  end

  def self.down
    drop_table :worlds
  end
end
