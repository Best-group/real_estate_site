class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer "listingID", :null => false
      t.integer "order", :null => false
      t.string "image_link", :limit => 100, :null => false
      t.string "thumbnail_link", :limit => 100, :null => false
      t.string "caption", :limit => 30

      t.timestamps null: false
    end
  end
end
