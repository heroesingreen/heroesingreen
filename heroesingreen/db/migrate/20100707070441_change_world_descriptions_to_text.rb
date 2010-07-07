class ChangeWorldDescriptionsToText < ActiveRecord::Migration
  def self.up
    change_column :worlds, :description, :text, :null => false
    change_column :world_missions, :description, :text, :null => false
  end

  def self.down
    change_column :worlds, :description, :string, :null => false
    change_column :world_missions, :description, :string, :null => false
  end
end
