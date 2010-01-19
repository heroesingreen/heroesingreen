class CreateLevels < ActiveRecord::Migration
  def self.up
    create_table :levels do |t|
      t.integer :number, :null => false
      t.string :title, :null => false
      t.integer :points_required, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :levels
  end
end
