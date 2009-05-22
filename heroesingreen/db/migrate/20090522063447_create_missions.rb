class CreateMissions < ActiveRecord::Migration
  def self.up
    create_table :missions do |t|
      t.string :title
      t.string :intro
      t.string :description
      t.string :task
      t.string :reward
      t.integer :points
      t.integer :type
      t.integer :unitPoints
      t.string  :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :missions
  end
end
