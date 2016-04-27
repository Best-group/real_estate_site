class CreateListingTypes < ActiveRecord::Migration
  def change
    create_table :listing_types do |t|
      t.string "property_type", :limit => 25, :null => false

      t.timestamps null: false
    end
  end
end
