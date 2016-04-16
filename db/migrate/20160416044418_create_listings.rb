class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :userID
      t.string :title
      t.integer :duration
      t.integer :suburbID
      t.string :street
      t.string :unit
      t.float :price
      t.integer :bedroom
      t.integer :bathroom
      t.integer :carports
      t.float :land_size
      t.string :description
      t.string :typeID
      t.integer :views
      t.boolean :sold

      t.timestamps
    end
  end
end
