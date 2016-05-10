class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer "userID", :null => false #FK
      t.integer "listingID", :null => false #FK

      t.timestamps null: false
    end
  end
end
