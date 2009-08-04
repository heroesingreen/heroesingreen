#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.column :comment,      :string
      t.column :name,         :string
      t.column :content_type, :string
      # If using MySQL, blobs default to 64k, so we have to give
      # an explicit size to extend them
      t.column :data,         :binary, :limit => 1.megabyte
    end
  end

  def self.down
    drop_table :pictures
  end
end
