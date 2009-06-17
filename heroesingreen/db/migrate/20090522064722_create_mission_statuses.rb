class CreateMissionStatuses < ActiveRecord::Migration
  def self.up
    create_table :mission_statuses do |t|
      t.integer :mission_id
      t.integer :user_id
      t.integer :status
      t.integer :int_data
      t.date :startDate

      t.timestamps
    end
  end

  def self.down
    drop_table :mission_statuses
  end
end
