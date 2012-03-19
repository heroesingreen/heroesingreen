class RemoveOldAuthFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :salt
    remove_column :users, :hashed_password
  end

  def self.down
    add_column :users, :hashed_password, :string
    add_column :users, :salt, :string
  end
end
