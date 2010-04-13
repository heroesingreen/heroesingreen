class AddAvatarToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :avatarImg, :string
  end

  def self.down
    remove_column :users, :avatarImg
  end
end
