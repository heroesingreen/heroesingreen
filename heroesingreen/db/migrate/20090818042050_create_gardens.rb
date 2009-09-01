class CreateGardens < ActiveRecord::Migration
  def self.up
    create_table :gardens do |t|
      t.string :name
      t.integer :size_x
      t.integer :size_y
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :gardens
  end
end
