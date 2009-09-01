class CreatePlots < ActiveRecord::Migration
  def self.up
    create_table :plots do |t|
      t.integer :garden_id
      t.integer :layer_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :plots
  end
end
