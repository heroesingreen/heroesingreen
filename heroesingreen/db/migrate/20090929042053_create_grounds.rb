class CreateGrounds < ActiveRecord::Migration
  def self.up
    create_table :grounds do |t|
    	t.integer :garden_id
		t.integer :x
		t.integer :y
		t.integer :wetness
		t.integer :nutrients
		t.timestamps      
    end
  end

  def self.down
    drop_table :grounds
  end
end
