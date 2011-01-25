class CreateMissionTagCategories < ActiveRecord::Migration
  def self.up
    create_table :mission_tag_categories do |t|
      t.string :mission_tag_category

      t.timestamps
    end
  end

  def self.down
    drop_table :mission_tag_categories
  end
end