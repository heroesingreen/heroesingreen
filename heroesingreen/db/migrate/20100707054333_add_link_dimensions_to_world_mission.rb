class AddLinkDimensionsToWorldMission < ActiveRecord::Migration
  def self.up
    add_column :world_missions, :link_css_top, :integer
    add_column :world_missions, :link_css_left, :integer
    add_column :world_missions, :link_css_width, :integer
    add_column :world_missions, :link_css_padding, :integer
    add_column :world_missions, :link_css_zindex, :integer
  end

  def self.down
    remove_column :world_missions, :link_css_top
    remove_column :world_missions, :link_css_left
    remove_column :world_missions, :link_css_width
    remove_column :world_missions, :link_css_padding
    remove_column :world_missions, :link_css_zindex
  end
end
