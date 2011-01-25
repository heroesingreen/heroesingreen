class CreateMissionTags < ActiveRecord::Migration
  def self.up
    create_table :mission_tags do |t|
      t.string :mission_tag

      t.timestamps
    end
  end

  def self.down
    drop_table :mission_tags
  end
end
