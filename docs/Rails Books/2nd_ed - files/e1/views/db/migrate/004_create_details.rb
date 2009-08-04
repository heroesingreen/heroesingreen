#---
# Excerpted from "Agile Web Development with Rails, 2nd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails2 for more book information.
#---
class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.column :product_id,   :integer
      t.column :sku,          :string
      t.column :manufacturer, :string
    end
  end

  def self.down
    drop_table :details
  end
end
