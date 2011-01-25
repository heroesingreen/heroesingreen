class CreateMissionTagCategoryMapping < ActiveRecord::Migration
  def self.up
    create_table :mission_tag_category_mappings do |t|
      t.integer :mission_tag_id
      t.integer :mission_tag_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mission_tag_category_mappings
  end
end