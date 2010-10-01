class CreateSignupEmails < ActiveRecord::Migration
  def self.up
    create_table :signup_emails do |t|
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :signup_emails
  end
end