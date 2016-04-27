class CreateSuburbs < ActiveRecord::Migration
  def change
    create_table :suburbs do |t|
      t.string "name", :limit => 50, :null => false
      t.string "state", :limit => 3, :null => false
      t.integer "postcode", :null => false

      t.timestamps null: false
    end
  end
end
