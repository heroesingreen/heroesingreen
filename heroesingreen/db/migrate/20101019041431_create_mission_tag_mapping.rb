class CreateMissionTagMapping < ActiveRecord::Migration
  def self.up
    create_table :mission_tag_mappings do |t|
      t.integer :mission_id
      t.integer :mission_tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mission_tag_mappings
  end
end