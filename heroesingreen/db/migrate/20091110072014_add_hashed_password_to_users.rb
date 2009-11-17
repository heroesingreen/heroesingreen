class AddHashedPasswordToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :hashed_password, :string, :null=>false
    add_column :users, :salt, :string, :null=>false
    change_column :users, :total_points, :integer, :default=>0
    remove_column :users, :password
  end

  def self.down
    remove_column :users, :hashed_password
    remove_column :users, :salt
    change_column :users, :total_points, :integer, :default=>nil
    add_column :users, :password, :string
  end
end
